Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id EFD0D2012D0
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 17:57:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592582252;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=g9LsodXhSeNcBtv22SQNQFNRWVsC3HR0z5QUqLfDDug=;
	b=BMkmdW4LqBzAwavdkuwEYhN7uYlS33jo75q0xeGapRvF+hmSjF8/l7PC3OHgLit8eXrVBq
	jUU45stslkJtPbMTMaq+EeacelL7Vl+05Jf45MaRt20Ofdlx/aueT3V+LDDR/r4LSM0hgw
	DTGFi2O/lF+zfEn4s9bXboSaGYrvghA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-ylrlSyLeP26DtsbxKhy-Cg-1; Fri, 19 Jun 2020 11:57:19 -0400
X-MC-Unique: ylrlSyLeP26DtsbxKhy-Cg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B08DC15B7F;
	Fri, 19 Jun 2020 15:57:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EFCC51992F;
	Fri, 19 Jun 2020 15:57:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CA2C914CC3;
	Fri, 19 Jun 2020 15:57:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JFv1eh022732 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 11:57:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 491BB1055DB9; Fri, 19 Jun 2020 15:57:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 44F3310590CD
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 15:56:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFF9E858EFE
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 15:56:58 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
	[209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-58-2qxisG-3MiS3hSia_ce_OQ-1; Fri, 19 Jun 2020 11:56:57 -0400
X-MC-Unique: 2qxisG-3MiS3hSia_ce_OQ-1
Received: by mail-wm1-f69.google.com with SMTP id x6so4116206wmj.9
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 08:56:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AV8HEdbR3wHixH2A75nEf35IGTJzbvXF8nQmsMCrEvY=;
	b=Zj47ZMBPvhkUovRUJ/oUtWEl11g6SedGOcy1NrXoj6ZZPW7LqeisyTKNWW/VvzFeZ+
	+ZWKfZ+MVPdJUmSjsQZDmVSn3jGZQeZagWe6+mboov70B13BVYAxNwpRwQMghI0riCxT
	ICzIeR6YvOh89LKKAEtrJXukdBH8qPtMdSar2WGHkHFVB83mkk+4lwSq6E3jchuLJfvA
	cEqF7N9tTHEpnVPlU9yPPX/Mjg6FbzcNqI68LVPQmQqpuz545IMRU5BMaqidNf1LHqa3
	wO7nDry5UKoaakj8wfFuj5gtactkwdfOl09qoBZTiOzNIffO6oE9oPrMoJCvySuVttPl
	YVWw==
X-Gm-Message-State: AOAM530akuCkETpqdwPz0TwBQ6S91vG3m9usz1upF3qH9QEiulAI1SNq
	z1Yw1iylIWrZMLNrwT+aCv6F0hJRi2baICrytDYpTLTsAytH8BKltmbAKIP9SzOYw7dPzrpzEFc
	QtxyLqmog3REzwUrfFxUBqGz/dffr2Dg=
X-Received: by 2002:adf:f812:: with SMTP id s18mr4601266wrp.28.1592582216150; 
	Fri, 19 Jun 2020 08:56:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwA4+1Lns67bTyhd3cKFHVaWR1ActNak+WfGbaQdgWtikYlQYtl0x/YUK2VmxQJyFNJKN6COO3oSngF1UpQmIk=
X-Received: by 2002:adf:f812:: with SMTP id s18mr4601256wrp.28.1592582215946; 
	Fri, 19 Jun 2020 08:56:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200619123803.1441373-1-yangerkun@huawei.com>
	<20200619123803.1441373-4-yangerkun@huawei.com>
In-Reply-To: <20200619123803.1441373-4-yangerkun@huawei.com>
From: Bryan Gurney <bgurney@redhat.com>
Date: Fri, 19 Jun 2020 11:56:45 -0400
Message-ID: <CAHhmqcS5wJbJdgZ+EucVuP8T_9DhUP-un0=s6CRZKfHdLb7wcQ@mail.gmail.com>
To: yangerkun <yangerkun@huawei.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: bmr@redhat.com, dm-devel@redhat.com, "Alasdair G. Kergon" <agk@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH v3 3/4] dm dust: add interface to list all
	badblocks
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 19, 2020 at 8:37 AM yangerkun <yangerkun@huawei.com> wrote:
>
> This interface may help anyone who want to know all badblocks without
> query block for each.
>
> Signed-off-by: yangerkun <yangerkun@huawei.com>
> ---
>  drivers/md/dm-dust.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/drivers/md/dm-dust.c b/drivers/md/dm-dust.c
> index a0c75c104de0..2ad8fc9293e0 100644
> --- a/drivers/md/dm-dust.c
> +++ b/drivers/md/dm-dust.c
> @@ -284,6 +284,31 @@ static int dust_clear_badblocks(struct dust_device *dd, char *result, unsigned i
>         return 1;
>  }
>
> +static int dust_list_badblocks(struct dust_device *dd, char *result, unsigned int maxlen,
> +                               unsigned int *sz_ptr)
> +{
> +       unsigned long flags;
> +       struct rb_root badblocklist;
> +       struct rb_node *node;
> +       struct badblock *bblk;
> +       unsigned int sz = *sz_ptr;
> +       unsigned long long num = 0;
> +
> +       spin_lock_irqsave(&dd->dust_lock, flags);
> +       badblocklist = dd->badblocklist;
> +       for (node = rb_first(&badblocklist); node; node = rb_next(node)) {
> +               bblk = rb_entry(node, struct badblock, node);
> +               DMEMIT("%llu\n", bblk->bb);
> +               num++;
> +       }
> +
> +       spin_unlock_irqrestore(&dd->dust_lock, flags);
> +       if (!num)
> +               DMEMIT("null");

Simply printing "null" may confuse the user into thinking that
something is wrong, when in fact everything is running normally, and
the bad block list is empty.

Heinz recommended returning an empty report, and I agree with that.
To the user, it would look something like this:

$ sudo dmsetup message dust1 0 listbadblocks

$ sudo dmsetup message dust1 0 countbadblocks
countbadblocks: 0 badblock(s) found


Thanks,

Bryan

> +
> +       return 1;
> +}
> +
>  /*
>   * Target parameters:
>   *
> @@ -427,6 +452,8 @@ static int dust_message(struct dm_target *ti, unsigned int argc, char **argv,
>                         else
>                                 dd->quiet_mode = false;
>                         r = 0;
> +               } else if (!strcasecmp(argv[0], "listbadblocks")) {
> +                       r = dust_list_badblocks(dd, result, maxlen, &sz);
>                 } else {
>                         invalid_msg = true;
>                 }
> --
> 2.25.4
>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

