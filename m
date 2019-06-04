Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C893F34F4D
	for <lists+dm-devel@lfdr.de>; Tue,  4 Jun 2019 19:48:40 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A873C83F4C;
	Tue,  4 Jun 2019 17:48:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2ECA5C207;
	Tue,  4 Jun 2019 17:48:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7E6641806B15;
	Tue,  4 Jun 2019 17:47:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x54HlHVA028275 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 4 Jun 2019 13:47:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0128579A1; Tue,  4 Jun 2019 17:47:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EEA7B2C2B7
	for <dm-devel@redhat.com>; Tue,  4 Jun 2019 17:47:14 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 91E84307B96B
	for <dm-devel@redhat.com>; Tue,  4 Jun 2019 17:46:53 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id v11so10774642pgl.5
	for <dm-devel@redhat.com>; Tue, 04 Jun 2019 10:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=MpoOgHHMQVs0HtZndub6hzt6kU+hoqaVhBVbnuUL9yo=;
	b=Y0rizqzUQ9qr/GYn5YJQfYEea5MhXCS5ELHA8e2OqAuwRhZmw3cgFTBmf1qFUbjBib
	OEl04XFkw3jIWszZ1AuX5ro9dDscSpgz9QnUFOxR85GZJFgCDSsLRIutC8GKs1QYbq1x
	ItPkMzBwBw99ECUi0lY+W9CnBE7PIOZVrrmZ/Pd2xKRnA9rhBPNxbjvBnAQBGPc7HVZe
	JWMNf67tdl2RA63QkKhDTIkeqfEER3vBIkpwba9Wpnnp10+j0JjSEUXQg3DYMTpBDRZz
	uoc2jP4kXhhR9cMz5rkihHF8C5g0U9scICahx5qkv6jM5yhMlrTtBOiU7i5tXeWSEXe8
	DAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=MpoOgHHMQVs0HtZndub6hzt6kU+hoqaVhBVbnuUL9yo=;
	b=rdVj3XMKabCH66bzFhVemL1F6G8AHx/2noPne0vRo5pThK44gir7lEhm+DSMahjg+/
	ku8C5xhjS7rzjwOejExbN92rfiGDmZlzpXe3jagsSiCsRTIkDvqjcGJup5zRBWY7hGr+
	ea4ayEsDszSZ91TGxHW6TrM32c58cqqrHdD6GExyc+9Nb80s6x+66xPS/3zrvq0NSzGb
	FVccW22QEkOeYm5HtfZGyw6zGW6msbyWjmIKHu1/K9MqSryqKsuivNm5+YzDc3QuQkXX
	9QQcLI7LvWqDgQATblRc89o/OqwTMdSH51t9HnBNZDhgs2/7I5zueg7B840RZwAMoLJS
	z3Pg==
X-Gm-Message-State: APjAAAWCkctsPKllwjHtd/Cl9133HnPMTRKb2ugtZNju/uq3bgxqGpAm
	jlxVaAVq2vFL/NE3TvpPSta1CA==
X-Google-Smtp-Source: APXvYqzIzgynvKQw9br8QM/gg+kOhkOcZy/6L2iOuW1q7h0QWao7brOxAr2KeUe/Detf1Vv2LFgLHw==
X-Received: by 2002:a62:e90a:: with SMTP id j10mr39389267pfh.147.1559670412881;
	Tue, 04 Jun 2019 10:46:52 -0700 (PDT)
Received: from localhost ([2620:10d:c090:200::1b10])
	by smtp.gmail.com with ESMTPSA id
	x129sm16306611pfb.29.2019.06.04.10.46.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Jun 2019 10:46:52 -0700 (PDT)
Date: Tue, 4 Jun 2019 10:46:50 -0700
From: Josef Bacik <josef@toxicpanda.com>
To: "zhangyi (F)" <yi.zhang@huawei.com>
Message-ID: <20190604174649.nwoguifzgbh7f7ey@roberthasiphone.dhcp.thefacebook.com>
References: <1559571534-16467-1-git-send-email-yi.zhang@huawei.com>
	<20190603144608.GA22116@redhat.com>
	<20190603190243.zqbfsgz22k3wghby@MacBook-Pro-91.local>
	<fae337b4-146e-743e-fe7d-6c796bfd560d@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fae337b4-146e-743e-fe7d-6c796bfd560d@huawei.com>
User-Agent: NeoMutt/20180716
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Tue, 04 Jun 2019 17:46:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Tue, 04 Jun 2019 17:46:53 +0000 (UTC) for IP:'209.85.215.193'
	DOMAIN:'mail-pg1-f193.google.com'
	HELO:'mail-pg1-f193.google.com' FROM:'josef@toxicpanda.com' RCPT:''
X-RedHat-Spam-Score: 0.203  (DKIM_INVALID, DKIM_SIGNED, RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,
	SPF_NONE) 209.85.215.193 mail-pg1-f193.google.com 209.85.215.193
	mail-pg1-f193.google.com <josef@toxicpanda.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <snitzer@redhat.com>, Josef Bacik <jbacik@fb.com>,
	Josef Bacik <josef@toxicpanda.com>, dm-devel@redhat.com,
	houtao1@huawei.com, agk@redhat.com
Subject: Re: [dm-devel] dm log writes: make sure the log super sectors are
 written in order
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Tue, 04 Jun 2019 17:48:39 +0000 (UTC)

On Tue, Jun 04, 2019 at 12:20:53PM +0800, zhangyi (F) wrote:
> On 2019/6/4 3:02, Josef Bacik Wrote:
> > On Mon, Jun 03, 2019 at 10:46:08AM -0400, Mike Snitzer wrote:
> >> On Mon, Jun 03 2019 at 10:18am -0400,
> >> zhangyi (F) <yi.zhang@huawei.com> wrote:
> >>
> >>> Currently, although we submit super bios in log-write thread orderly
> >>> (the super.nr_entries is incremented by each logged entry), the
> >>> submit_bio() cannot make sure that each super sector is written to log
> >>> device in order. So the submitting bio of each super sector may be
> >>> out-of-order, and then the final nr_entries maybe small than the real
> >>> entries submitted.
> >>>
> >>> This problem can be reproduced by the xfstests generic/455 with ext4,
> >>> which may complained below after running the test:
> >>>
> >>>   QA output created by 455
> >>>  -Silence is golden
> >>>  +mark 'end' does not exist
> >>>
> >>> This patch serialize submitting super secotrs to make sure each super
> >>> sectors are written to log disk in order.
> >>>
> >>> Signed-off-by: zhangyi (F) <yi.zhang@huawei.com>
> >>
> >> This doesn't feel right.
> >>
> >> You raised 2 things you're trying to address:
> >> 1) IO is out of order
> >> 2) accounting (nr_entries) isn't correct
> >>
> >> I'll need to reviewer closer but serializing "super" bios doesn't seem
> >> like the best fix.
> >>
> >> Josef, any chance you can weigh in on this?  AFAIK you are still "the
> >> man" for dm-log-writes ;)
> >>
> > 
> > Well the #2 is caused by #1, we submit the bio for a super two times in a row
> > and it's a crapshoot which one makes it to disk.  So he's right, and it's kind
> > of funny because this is the sort of problem that dm-log-writes was written to
> > catch, and I fucked it up here ;).  That being said this is a bit
> > over-engineered, can we just add a completion to the log buff and do a
> > wait_for_completion() when we're writing out the super?  It's not like this thing
> > needs to be super performant.  Thanks,
> > 
> 
> Hi, Josef
> 
> Thanks for your suggestions. It's fine by me to switch to use completion
> instead. Some thing like this?
> 
> ...
> @@ -180,6 +182,15 @@ static void log_end_io(struct bio *bio)
>         bio_put(bio);
>  }
> 
> +static void log_end_super(struct bio *bio)
> +{
> +       struct log_writes_c *lc = bio->bi_private;
> +
> +       /* Wake up log-write kthread that super has been written */
> +       complete(&lc->super_comp);
> +       log_end_io(bio);
> +}
> +
>  /*
>   * Meant to be called if there is an error, it will free all the pages
>   * associated with the block.
> @@ -215,7 +226,8 @@ static int write_metadata(struct log_writes_c *lc, void *entry,
>         bio->bi_iter.bi_size = 0;
>         bio->bi_iter.bi_sector = sector;
>         bio_set_dev(bio, lc->logdev->bdev);
> -       bio->bi_end_io = log_end_io;
> +       bio->bi_end_io = (sector == WRITE_LOG_SUPER_SECTOR) ?
> +                         log_end_super : log_end_io;
>         bio->bi_private = lc;
>         bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
> 
> @@ -418,11 +430,19 @@ static int log_super(struct log_writes_c *lc)
>         super.nr_entries = cpu_to_le64(lc->logged_entries);
>         super.sectorsize = cpu_to_le32(lc->sectorsize);
> 
> -       if (write_metadata(lc, &super, sizeof(super), NULL, 0, 0)) {
> +       if (write_metadata(lc, &super, sizeof(super), NULL, 0,
> +                          WRITE_LOG_SUPER_SECTOR)) {
>                 DMERR("Couldn't write super");
>                 return -1;
>         }
> 
> +       /*
> +        * Super sector should be writen in-order, or else the
> +        * nr_entries could be rewritten by the old bio and small
> +        * than the real submitted entries.
> +        */
> +       wait_for_completion_io(&lc->super_comp);
> +
>         return 0;
>  }
> ...
> 
> But one thing need to mention is that, IIUC, If we use completion, the
> log_writes_kthread have to wait on writing out every super bio, so it cannot
> keep on submitting subsequent log bios. It maybe more performance impact
> than my v1 (it only wait on previous super if it was not finished).
>

Yeah but like I said, we're not worried about performance here.  It's in an
async thread, the fs will never be waiting on these IO's to finish.  It may slow
down the end of xfstests that need to wait for the log to finish flushing, but I
think that's probably fine.

Another solution is to only write the super when we destroy the device, cause
frankly we don't really need the super until we're done anyway.  Thanks,

Josef 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
