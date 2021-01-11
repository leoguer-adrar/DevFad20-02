<?php

class Bug
{
    use Bdd;
    private int $id_bug;
    private string $title_bug;
    private string $description_bug;
    private string $video_bug;
    private string $date_bug; //utiliser la class DateTime mais on ne l'a pas encore vu en cours

    public function getIDbug(): int
    {
        return $this->id_bug;
    }

    public function setIDbug(int $pIDbug): void
    {
        $this->id_bug = $pIDbug;
    }

    public function getTitlebug(): string
    {
        return $this->title_bug;
    }

    public function setTitlebug(string $pTitlebug): void
    {
        $this->title_bug = $pTitlebug;
    }

    public function getDescriptionbug(): string
    {
        return $this->description_bug;
    }

    public function setDescriptionbug(string $pDescriptionbug): void
    {
        $this->description_bug = $pDescriptionbug;
    }

    public function getVideobug(): string
    {
        return $this->video_bug;
    }

    public function setVideobug(string $pVideobug): void
    {
        $this->video_bug = $pVideobug;
    }

    public function getDatebug(): string
    {
        return $this->date_bug;
    }

    public function setDatebug(string $pDatebug): void
    {
        $this->date_bug = $pDatebug;
    }

    public function getbyIDbug(int $id_bug): ?array
    {
        $bug = $this->prepare('select * from bug where id = :id', [
            ':id' => $id_bug
        ]);
        return $bug;
    }

    public function allbug(): ?array
    {
        return $this->prepare('select * from bug');
    }

    public function saveBug(): void
    {
        $this->prepare('insert into bug (title_bug, description_bug, video_bug, date_bug) value (:title_bug, :description_bug, :video_bug, :date_bug)',
            [
                ':title_bug' => $this->getTitlebug(),
                ':description_bug' => $this->getDescriptionbug(),
                ':video_bug' => $this->getVideobug(),
                ':date_bug' => $this->getDatebug(),
            ],
            false
        );
    }

    public function showBug(): array
    {
        return $this->prepare('select * from bug');
    }
}
