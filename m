Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 3D19225C25B
	for <lists+dm-devel@lfdr.de>; Thu,  3 Sep 2020 16:19:30 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-qzqtYPWBMp2vailB_ta82w-1; Thu, 03 Sep 2020 10:19:26 -0400
X-MC-Unique: qzqtYPWBMp2vailB_ta82w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A46A110082EA;
	Thu,  3 Sep 2020 14:19:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CC6C1002D5B;
	Thu,  3 Sep 2020 14:19:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 66E89181A06B;
	Thu,  3 Sep 2020 14:19:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0838KGBJ018331 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 3 Sep 2020 04:20:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6BED6108449F; Thu,  3 Sep 2020 08:20:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 676161084495
	for <dm-devel@redhat.com>; Thu,  3 Sep 2020 08:20:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08FA68007D1
	for <dm-devel@redhat.com>; Thu,  3 Sep 2020 08:20:14 +0000 (UTC)
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-372-G6nxiY0NMDeIVkiR8QlRng-1; Thu, 03 Sep 2020 04:20:11 -0400
X-MC-Unique: G6nxiY0NMDeIVkiR8QlRng-1
Received: by mail-vk1-f196.google.com with SMTP id c25so605175vkm.1
	for <dm-devel@redhat.com>; Thu, 03 Sep 2020 01:20:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kIOKgbobCAauivLjjD3+5H4D5uI6eOXaqQyNwWMzaro=;
	b=HQb1R41CrlZDsX9STJa8oHGDltOpoUKX1EoCttyPLTDDumE8oo2MuO4b3tnjCCkTN6
	vl99xSFy3pprFfCKd24mWnGla6fiOIgw9DWgUAbftVH4bqt0NI8+AXruFK1vUqQ0Cxx/
	INGfw4Ekl5Kt6OZkTsqLHO0auCUQ79AG+70KjrlSMF3xxXtm645joIYtP9uupt+yM2A7
	ZfhTX2HVJalUWW0o85RDN/+uGKGjnNp1IRtRtkrz2gfZKALyqKuMT6T+QguKPdScZQQH
	1kWELRHCSruGvSECrpuyk1IFfzDt6TMGC8+6y0vLQ4uC3+zzHBPVITKEV8DD6qX7qGOa
	UZRA==
X-Gm-Message-State: AOAM5332ya6CqYZdKIcqOlbAK/3kE1ptPSGpjG3uMjY9eSkQLaLhMITx
	HK1DckYhb3gOx0EOP9DoF4wkjQbdTbqn3dGzy60UMQ==
X-Google-Smtp-Source: ABdhPJygatPCTgngzA8BfCoD0l3nfEZ9seGBOFA3kGWjYO2vX4zcfDvdTtVrBTHFloSlsoY7V3JH6u4jQTlBSAJOSyQ=
X-Received: by 2002:a1f:e443:: with SMTP id b64mr859520vkh.17.1599121210936;
	Thu, 03 Sep 2020 01:20:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200903054104.228829-1-hch@lst.de>
	<20200903054104.228829-3-hch@lst.de>
In-Reply-To: <20200903054104.228829-3-hch@lst.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 3 Sep 2020 10:19:34 +0200
Message-ID: <CAPDyKFrkcpziGFPmSd8Kx4bzhoN6zxF1E8MagLQSa4sBmnicOg@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 03 Sep 2020 10:17:20 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	linux-scsi <linux-scsi@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	linux-s390@vger.kernel.org,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-block <linux-block@vger.kernel.org>,
	linux-ide@vger.kernel.org, dm-devel@redhat.com,
	target-devel@vger.kernel.org, drbd-dev@tron.linbit.com
Subject: Re: [dm-devel] [PATCH 2/9] block: add a bdev_is_partition helper
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 3 Sep 2020 at 07:42, Christoph Hellwig <hch@lst.de> wrote:
>
> Add a littler helper to make the somewhat arcane bd_contains checks a
> little more obvious.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Not sure why we have both "bd_contains" and "bd_partno", nevertheless,
feel free to add:

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  block/blk-lib.c                 | 2 +-
>  block/ioctl.c                   | 4 ++--
>  block/scsi_ioctl.c              | 2 +-
>  drivers/ide/ide-ioctls.c        | 4 ++--
>  drivers/md/dm-table.c           | 2 +-
>  drivers/mmc/core/block.c        | 2 +-
>  drivers/s390/block/dasd_ioctl.c | 8 ++++----
>  fs/nfsd/blocklayout.c           | 4 ++--
>  include/linux/blkdev.h          | 9 +++++++--
>  kernel/trace/blktrace.c         | 2 +-
>  10 files changed, 22 insertions(+), 17 deletions(-)
>
> diff --git a/block/blk-lib.c b/block/blk-lib.c
> index 0d1811e57ac704..e90614fd8d6a42 100644
> --- a/block/blk-lib.c
> +++ b/block/blk-lib.c
> @@ -64,7 +64,7 @@ int __blkdev_issue_discard(struct block_device *bdev, sector_t sector,
>                 return -EINVAL;
>
>         /* In case the discard request is in a partition */
> -       if (bdev->bd_partno)
> +       if (bdev_is_partition(bdev))
>                 part_offset = bdev->bd_part->start_sect;
>
>         while (nr_sects) {
> diff --git a/block/ioctl.c b/block/ioctl.c
> index bdb3bbb253d9f8..e4af3df9d28a68 100644
> --- a/block/ioctl.c
> +++ b/block/ioctl.c
> @@ -23,7 +23,7 @@ static int blkpg_do_ioctl(struct block_device *bdev,
>                 return -EACCES;
>         if (copy_from_user(&p, upart, sizeof(struct blkpg_partition)))
>                 return -EFAULT;
> -       if (bdev != bdev->bd_contains)
> +       if (bdev_is_partition(bdev))
>                 return -EINVAL;
>
>         if (p.pno <= 0)
> @@ -94,7 +94,7 @@ static int blkdev_reread_part(struct block_device *bdev)
>  {
>         int ret;
>
> -       if (!disk_part_scan_enabled(bdev->bd_disk) || bdev != bdev->bd_contains)
> +       if (!disk_part_scan_enabled(bdev->bd_disk) || bdev_is_partition(bdev))
>                 return -EINVAL;
>         if (!capable(CAP_SYS_ADMIN))
>                 return -EACCES;
> diff --git a/block/scsi_ioctl.c b/block/scsi_ioctl.c
> index ef722f04f88a93..3bb4571385ce21 100644
> --- a/block/scsi_ioctl.c
> +++ b/block/scsi_ioctl.c
> @@ -854,7 +854,7 @@ EXPORT_SYMBOL(scsi_cmd_ioctl);
>
>  int scsi_verify_blk_ioctl(struct block_device *bd, unsigned int cmd)
>  {
> -       if (bd && bd == bd->bd_contains)
> +       if (bd && !bdev_is_partition(bd))
>                 return 0;
>
>         if (capable(CAP_SYS_RAWIO))
> diff --git a/drivers/ide/ide-ioctls.c b/drivers/ide/ide-ioctls.c
> index 09491098047bff..58994da10c0664 100644
> --- a/drivers/ide/ide-ioctls.c
> +++ b/drivers/ide/ide-ioctls.c
> @@ -49,7 +49,7 @@ int ide_setting_ioctl(ide_drive_t *drive, struct block_device *bdev,
>         return err >= 0 ? put_user_long(err, arg) : err;
>
>  set_val:
> -       if (bdev != bdev->bd_contains)
> +       if (bdev_is_partition(bdev))
>                 err = -EINVAL;
>         else {
>                 if (!capable(CAP_SYS_ADMIN))
> @@ -257,7 +257,7 @@ int generic_ide_ioctl(ide_drive_t *drive, struct block_device *bdev,
>         switch (cmd) {
>         case HDIO_OBSOLETE_IDENTITY:
>         case HDIO_GET_IDENTITY:
> -               if (bdev != bdev->bd_contains)
> +               if (bdev_is_partition(bdev))
>                         return -EINVAL;
>                 return ide_get_identity_ioctl(drive, cmd, argp);
>         case HDIO_GET_NICE:
> diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
> index 5edc3079e7c199..af156256e511ff 100644
> --- a/drivers/md/dm-table.c
> +++ b/drivers/md/dm-table.c
> @@ -903,7 +903,7 @@ static int device_is_rq_stackable(struct dm_target *ti, struct dm_dev *dev,
>         struct request_queue *q = bdev_get_queue(bdev);
>
>         /* request-based cannot stack on partitions! */
> -       if (bdev != bdev->bd_contains)
> +       if (bdev_is_partition(bdev))
>                 return false;
>
>         return queue_is_mq(q);
> diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
> index fa313b63413547..8d3df0be0355ce 100644
> --- a/drivers/mmc/core/block.c
> +++ b/drivers/mmc/core/block.c
> @@ -723,7 +723,7 @@ static int mmc_blk_check_blkdev(struct block_device *bdev)
>          * whole block device, not on a partition.  This prevents overspray
>          * between sibling partitions.
>          */
> -       if ((!capable(CAP_SYS_RAWIO)) || (bdev != bdev->bd_contains))
> +       if (!capable(CAP_SYS_RAWIO) || bdev_is_partition(bdev))
>                 return -EPERM;
>         return 0;
>  }
> diff --git a/drivers/s390/block/dasd_ioctl.c b/drivers/s390/block/dasd_ioctl.c
> index faaf5596e31c12..cb6427fb9f3d16 100644
> --- a/drivers/s390/block/dasd_ioctl.c
> +++ b/drivers/s390/block/dasd_ioctl.c
> @@ -277,7 +277,7 @@ dasd_ioctl_format(struct block_device *bdev, void __user *argp)
>                 dasd_put_device(base);
>                 return -EFAULT;
>         }
> -       if (bdev != bdev->bd_contains) {
> +       if (bdev_is_partition(bdev)) {
>                 pr_warn("%s: The specified DASD is a partition and cannot be formatted\n",
>                         dev_name(&base->cdev->dev));
>                 dasd_put_device(base);
> @@ -304,7 +304,7 @@ static int dasd_ioctl_check_format(struct block_device *bdev, void __user *argp)
>         base = dasd_device_from_gendisk(bdev->bd_disk);
>         if (!base)
>                 return -ENODEV;
> -       if (bdev != bdev->bd_contains) {
> +       if (bdev_is_partition(bdev)) {
>                 pr_warn("%s: The specified DASD is a partition and cannot be checked\n",
>                         dev_name(&base->cdev->dev));
>                 rc = -EINVAL;
> @@ -362,7 +362,7 @@ static int dasd_ioctl_release_space(struct block_device *bdev, void __user *argp
>                 rc = -EROFS;
>                 goto out_err;
>         }
> -       if (bdev != bdev->bd_contains) {
> +       if (bdev_is_partition(bdev)) {
>                 pr_warn("%s: The specified DASD is a partition and tracks cannot be released\n",
>                         dev_name(&base->cdev->dev));
>                 rc = -EINVAL;
> @@ -540,7 +540,7 @@ dasd_ioctl_set_ro(struct block_device *bdev, void __user *argp)
>
>         if (!capable(CAP_SYS_ADMIN))
>                 return -EACCES;
> -       if (bdev != bdev->bd_contains)
> +       if (bdev_is_partition(bdev))
>                 // ro setting is not allowed for partitions
>                 return -EINVAL;
>         if (get_user(intval, (int __user *)argp))
> diff --git a/fs/nfsd/blocklayout.c b/fs/nfsd/blocklayout.c
> index 311e5ce80cfc27..a07c39c94bbd03 100644
> --- a/fs/nfsd/blocklayout.c
> +++ b/fs/nfsd/blocklayout.c
> @@ -170,7 +170,7 @@ nfsd4_block_proc_getdeviceinfo(struct super_block *sb,
>                 struct nfs4_client *clp,
>                 struct nfsd4_getdeviceinfo *gdp)
>  {
> -       if (sb->s_bdev != sb->s_bdev->bd_contains)
> +       if (bdev_is_partition(sb->s_bdev))
>                 return nfserr_inval;
>         return nfserrno(nfsd4_block_get_device_info_simple(sb, gdp));
>  }
> @@ -382,7 +382,7 @@ nfsd4_scsi_proc_getdeviceinfo(struct super_block *sb,
>                 struct nfs4_client *clp,
>                 struct nfsd4_getdeviceinfo *gdp)
>  {
> -       if (sb->s_bdev != sb->s_bdev->bd_contains)
> +       if (bdev_is_partition(sb->s_bdev))
>                 return nfserr_inval;
>         return nfserrno(nfsd4_block_get_device_info_scsi(sb, clp, gdp));
>  }
> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> index 7575fa0aae6e5c..0006a78ebc5dde 100644
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -1341,6 +1341,11 @@ static inline int sb_issue_zeroout(struct super_block *sb, sector_t block,
>
>  extern int blk_verify_command(unsigned char *cmd, fmode_t mode);
>
> +static inline bool bdev_is_partition(struct block_device *bdev)
> +{
> +       return bdev->bd_partno;
> +}
> +
>  enum blk_default_limits {
>         BLK_MAX_SEGMENTS        = 128,
>         BLK_SAFE_MAX_SECTORS    = 255,
> @@ -1457,7 +1462,7 @@ static inline int bdev_alignment_offset(struct block_device *bdev)
>
>         if (q->limits.misaligned)
>                 return -1;
> -       if (bdev != bdev->bd_contains)
> +       if (bdev_is_partition(bdev))
>                 return queue_limit_alignment_offset(&q->limits,
>                                 bdev->bd_part->start_sect);
>         return q->limits.alignment_offset;
> @@ -1498,7 +1503,7 @@ static inline int bdev_discard_alignment(struct block_device *bdev)
>  {
>         struct request_queue *q = bdev_get_queue(bdev);
>
> -       if (bdev != bdev->bd_contains)
> +       if (bdev_is_partition(bdev))
>                 return queue_limit_discard_alignment(&q->limits,
>                                 bdev->bd_part->start_sect);
>         return q->limits.discard_alignment;
> diff --git a/kernel/trace/blktrace.c b/kernel/trace/blktrace.c
> index 4b3a42fc3b24f1..157758a88773b9 100644
> --- a/kernel/trace/blktrace.c
> +++ b/kernel/trace/blktrace.c
> @@ -527,7 +527,7 @@ static int do_blk_trace_setup(struct request_queue *q, char *name, dev_t dev,
>          * and scsi-generic block devices we create a temporary new debugfs
>          * directory that will be removed once the trace ends.
>          */
> -       if (bdev && bdev == bdev->bd_contains)
> +       if (bdev && !bdev_is_partition(bdev))
>                 dir = q->debugfs_dir;
>         else
>                 bt->dir = dir = debugfs_create_dir(buts->name, blk_debugfs_root);
> --
> 2.28.0
>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

