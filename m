Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 670877F617
	for <lists+dm-devel@lfdr.de>; Fri,  2 Aug 2019 13:40:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7CBE7300177B;
	Fri,  2 Aug 2019 11:40:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FF8B5D9DC;
	Fri,  2 Aug 2019 11:40:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF6981800205;
	Fri,  2 Aug 2019 11:39:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6VJhI2M025184 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 31 Jul 2019 15:43:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5EC8560C47; Wed, 31 Jul 2019 19:43:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 592C760BF7
	for <dm-devel@redhat.com>; Wed, 31 Jul 2019 19:43:16 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3C7B383F45
	for <dm-devel@redhat.com>; Wed, 31 Jul 2019 19:43:15 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id d15so50108971qkl.4
	for <dm-devel@redhat.com>; Wed, 31 Jul 2019 12:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ecd6W3R0njrZioVOViuV3qXfRmYn4ujysQP/38uUwIs=;
	b=HfIHDkguJb3ZRYwzgBkmFRZLtuaEDVZSijTkkU6OU5dA6nj+YNI+LeXUmXqJiO78VY
	Ozj1zpqa1qocj3+wrJzu7iOYZDWOXxdUfXSepdWdV8691/mjHWoTrkywANkfWlOnlTqB
	fcUSGd8E/Tic7myXmw/SnXWzMM6Qvt23V+CUPjg71jsS6ibbBh/0kiIhvxuR8V5aGVPs
	oZyn2gv4qWkuCPRMeoTrG4lRt/m+mAVczt7We+Zmg9qdcdIpNfXdAXbs3aKH2qmYvY2m
	J8A7CVRBLGDlkuyl1DjgnroR0+yW6aRKiaHml7hS1QSr/fSF6UP3OJiFY9PBm92Rlz7X
	eIeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ecd6W3R0njrZioVOViuV3qXfRmYn4ujysQP/38uUwIs=;
	b=TCl4/tMCKh25WzHj+sWPKrdfBMObJVPSgJCl5MWWrEifWMAtIAs4zq698Qn9+WFhuz
	km4lzWpOowU3XQpgmdo4AWZZPIfaBw2S0v6Qhs5WBhg471PkstUNilEYJi83EK5t5XDw
	YdLW7zpxMhuWxLrVhmJNEDKTtVV4uj866iPAdgSTukQzySGYdopPMYTdVMHwIEeKynWz
	HRX5iA/kCZoeyXiwOsSUMQR+lNOX+4/z1Gve2tez4XNnqc5laqyheoqnSeVchRWysRCw
	Jn0mvAZ2B9MMIiLUuCHvzl48oVAy9mUKqB6AO9j84s3pMq8hONfxPOO3jiIXww8Ud9IK
	/+9g==
X-Gm-Message-State: APjAAAWkg5HQhRgxec1URD9lmhTNLzVkUC13xAI8M5dlenZPmsjXuYKU
	KDeqVZM07w3tCMdpnu6ioIwElrGLRwACYI1v3sg=
X-Google-Smtp-Source: APXvYqzJlHprzYhgXCO8ToMunyG6J6KTS71kSqu69XXhwF0MPxdW19nGEvyN0u77PMCkV2eG+onE1l5N7+OHsoGXOsA=
X-Received: by 2002:a37:a854:: with SMTP id r81mr83164982qke.378.1564602194417;
	Wed, 31 Jul 2019 12:43:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190729203135.12934-1-gpiccoli@canonical.com>
	<20190729203135.12934-2-gpiccoli@canonical.com>
In-Reply-To: <20190729203135.12934-2-gpiccoli@canonical.com>
From: Song Liu <liu.song.a23@gmail.com>
Date: Wed, 31 Jul 2019 12:43:03 -0700
Message-ID: <CAPhsuW5n9TCZjVT3QnFhHkbfPTvh7ifFiNXypOHouL5ByZS7+w@mail.gmail.com>
To: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 31 Jul 2019 19:43:15 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Wed, 31 Jul 2019 19:43:15 +0000 (UTC) for IP:'209.85.222.194'
	DOMAIN:'mail-qk1-f194.google.com'
	HELO:'mail-qk1-f194.google.com' FROM:'liu.song.a23@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.15  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.222.194 mail-qk1-f194.google.com 209.85.222.194
	mail-qk1-f194.google.com <liu.song.a23@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 02 Aug 2019 07:39:28 -0400
Cc: linux-block@vger.kernel.org, Song Liu <songliubraving@fb.com>,
	NeilBrown <neilb@suse.com>,
	linux-raid <linux-raid@vger.kernel.org>, dm-devel@redhat.com,
	Jay Vosburgh <jay.vosburgh@canonical.com>
Subject: Re: [dm-devel] [PATCH 1/2] md/raid0: Introduce new array state
	'broken' for raid0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Fri, 02 Aug 2019 11:40:06 +0000 (UTC)

On Mon, Jul 29, 2019 at 1:33 PM Guilherme G. Piccoli
<gpiccoli@canonical.com> wrote:
>
> Currently if a md/raid0 array gets one or more members removed while
> being mounted, kernel keeps showing state 'clean' in the 'array_state'
> sysfs attribute. Despite udev signaling the member device is gone, 'mdadm'
> cannot issue the STOP_ARRAY ioctl successfully, given the array is mounted.
>
> Nothing else hints that something is wrong (except that the removed devices
> don't show properly in the output of 'mdadm detail' command). There is no
> other property to be checked, and if user is not performing reads/writes
> to the array, even kernel log is quiet and doesn't give a clue about the
> missing member.
>
> This patch changes this behavior; when 'array_state' is read we introduce
> a non-expensive check (only for raid0) that relies in the comparison of
> the total number of disks when array was assembled with gendisk flags of
> those devices to validate if all members are available and functional.
> A new array state 'broken' was added: it mimics the state 'clean' in every
> aspect, being useful only to distinguish if such array has some member
> missing. Also, we show a rate-limited warning in kernel log in such case.
>
> This patch has no proper functional change other than adding a 'clean'-like
> state; it was tested with ext4 and xfs filesystems. It requires a 'mdadm'
> counterpart to handle the 'broken' state.
>
> Cc: NeilBrown <neilb@suse.com>
> Cc: Song Liu <songliubraving@fb.com>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@canonical.com>
> ---
>
[...]
> @@ -4315,6 +4329,7 @@ array_state_store(struct mddev *mddev, const char *buf, size_t len)
>                 break;
>         case write_pending:
>         case active_idle:
> +       case broken:
>                 /* these cannot be set */
>                 break;
>         }

Maybe it is useful to set "broken" state? When user space found some issues
with the drive?

Thanks,
Song


> diff --git a/drivers/md/md.h b/drivers/md/md.h
> index 41552e615c4c..e7b42b75701a 100644
> --- a/drivers/md/md.h
> +++ b/drivers/md/md.h
> @@ -590,6 +590,8 @@ struct md_personality
>         int (*congested)(struct mddev *mddev, int bits);
>         /* Changes the consistency policy of an active array. */
>         int (*change_consistency_policy)(struct mddev *mddev, const char *buf);
> +       /* Check if there is any missing/failed members - RAID0 only for now. */
> +       bool (*is_missing_dev)(struct mddev *mddev);
>  };
>
>  struct md_sysfs_entry {
> diff --git a/drivers/md/raid0.c b/drivers/md/raid0.c
> index 58a9cc5193bf..79618a6ae31a 100644
> --- a/drivers/md/raid0.c
> +++ b/drivers/md/raid0.c
> @@ -455,6 +455,31 @@ static inline int is_io_in_chunk_boundary(struct mddev *mddev,
>         }
>  }
>
> +bool raid0_is_missing_dev(struct mddev *mddev)
> +{
> +       struct md_rdev *rdev;
> +       static int already_missing;
> +       int def_disks, work_disks = 0;
> +       struct r0conf *conf = mddev->private;
> +
> +       def_disks = conf->strip_zone[0].nb_dev;
> +       rdev_for_each(rdev, mddev)
> +               if (rdev->bdev->bd_disk->flags & GENHD_FL_UP)
> +                       work_disks++;
> +
> +       if (unlikely(def_disks - work_disks)) {
> +               if (!already_missing) {
> +                       already_missing = 1;
> +                       pr_warn("md: %s: raid0 array has %d missing/failed members\n",
> +                               mdname(mddev), (def_disks - work_disks));
> +               }
> +               return true;
> +       }
> +
> +       already_missing = 0;
> +       return false;
> +}
> +
>  static void raid0_handle_discard(struct mddev *mddev, struct bio *bio)
>  {
>         struct r0conf *conf = mddev->private;
> @@ -789,6 +814,7 @@ static struct md_personality raid0_personality=
>         .takeover       = raid0_takeover,
>         .quiesce        = raid0_quiesce,
>         .congested      = raid0_congested,
> +       .is_missing_dev = raid0_is_missing_dev,
>  };
>
>  static int __init raid0_init (void)
> --
> 2.22.0
>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
