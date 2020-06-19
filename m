Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7AAA220195A
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 19:24:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592587443;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=L/04N6G2Eksah17XmxLRch6ANuk+pgdrWoNL1sb7oVY=;
	b=K3Uh5lNMBH7DlNyQc9jm+0sDoAol/JMQj7fHiFlHzN3m+6qCVITrMUmQxYe795rvW8iYT2
	UIHVeOIkZPkQXF4X8QoMiWPAOcAXf8q/OdXpSLDGkn7OgNBg7MZzldksIcsUh6HC3uQL1p
	6SZU2dZI1542m+T0IuRNjTULFiCR+XY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-Bd8kIeTyPvyNkcF12b1GnQ-1; Fri, 19 Jun 2020 13:24:00 -0400
X-MC-Unique: Bd8kIeTyPvyNkcF12b1GnQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53818EC1A6;
	Fri, 19 Jun 2020 17:23:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8C465BAC6;
	Fri, 19 Jun 2020 17:23:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7F6471809547;
	Fri, 19 Jun 2020 17:23:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JHNYKT002611 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 13:23:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AD2CC107273; Fri, 19 Jun 2020 17:23:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8BB2107271
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 17:23:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 44C1B8007A4
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 17:23:32 +0000 (UTC)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
	[209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-335-PBogGX_rPvalm5xZ2LHayw-1; Fri, 19 Jun 2020 13:23:30 -0400
X-MC-Unique: PBogGX_rPvalm5xZ2LHayw-1
Received: by mail-ej1-f71.google.com with SMTP id hj12so4208110ejb.13
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 10:23:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XbYfyVCJ3N5zrZbYhoBESuipgwxtNqAhhl/RVoDN6po=;
	b=CELJohCsXoJzX8rTl4oyz9LJEGzNJpepBqsIRiurHzYTuKNT/uRrXKcmcU5KBRTRVZ
	CDx+SQa5HO72Bi3/6W/tJw6z/8nSkwzfLcw3bLea+9mX0HpdzU+qFvNrQ3qCh+M5xpHt
	KJvPosNWlo5DMhBpj5QKKZZHIPUMDxax2V8OlSaUGlV8PlukJR0yyB+9hU2FPlw/lyYo
	M71SFH1d0FC75sFWtchA7GCVuE6xR99/rR42Iusczbt4Vac0Vs+KD61s5MRXNzpHldG6
	MeI5x5BLJG/NpUq/Dimz8GDNQxZtZBy7rVs9SPIcma/HTOAYQufpiMwrIiX6D3WNW/IL
	EIFw==
X-Gm-Message-State: AOAM530ZgPLz/9VEQbCdJDBgaeAX+AItl/T8GF2+1jM82H8yr5QaYx6k
	Tz/InSg7QSDn2y6Pmr3lXb0JM9AoDIC+Ac5n8wBRf9iJRx5R9Bb3FRfMVbV2gijyhCtdQQx+duG
	HEGd3Gc3euBrUjmsM+tORHiLRvAJxxtg=
X-Received: by 2002:a17:906:f2c2:: with SMTP id
	gz2mr4565606ejb.260.1592587408864; 
	Fri, 19 Jun 2020 10:23:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfFzvwrbMZx8IgKtI7qBBs9RKzPw6xEN1v0hZnMLKw1MA5OMBKCV0Ween7eGjRErlRfympZ5hE6AnzBNvi8lU=
X-Received: by 2002:adf:f812:: with SMTP id s18mr4960322wrp.28.1592587408242; 
	Fri, 19 Jun 2020 10:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200619123803.1441373-1-yangerkun@huawei.com>
	<20200619123803.1441373-2-yangerkun@huawei.com>
	<CAHhmqcTdxeTrpBuJBLqch9FzYuv=k+73fOjStsd-NmoDRyFffQ@mail.gmail.com>
	<20200619154445.GA24500@redhat.com>
In-Reply-To: <20200619154445.GA24500@redhat.com>
From: Bryan Gurney <bgurney@redhat.com>
Date: Fri, 19 Jun 2020 13:23:17 -0400
Message-ID: <CAHhmqcSB_bd8dO75pQny=MxNxd1=3mpHDCtX_faiO2VUFx616w@mail.gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: yangerkun <yangerkun@huawei.com>, dm-devel@redhat.com, bmr@redhat.com,
	"Alasdair G. Kergon" <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH v3 1/4] dm dust: report some message results
	back to user directly
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 19, 2020 at 11:45 AM Mike Snitzer <snitzer@redhat.com> wrote:
>
> On Fri, Jun 19 2020 at 11:40am -0400,
> Bryan Gurney <bgurney@redhat.com> wrote:
>
> > On Fri, Jun 19, 2020 at 8:37 AM yangerkun <yangerkun@huawei.com> wrote:
> > >
> > > Some type of message(queryblock/countbadblocks/removebadblock) may better
> > > report results to user directly. Do it with DMEMIT.
> > >
> > > Signed-off-by: yangerkun <yangerkun@huawei.com>
> > > ---
> > >  drivers/md/dm-dust.c | 31 ++++++++++++++++++-------------
> > >  1 file changed, 18 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/drivers/md/dm-dust.c b/drivers/md/dm-dust.c
> > > index ff03b90072c5..a0c75c104de0 100644
> > > --- a/drivers/md/dm-dust.c
> > > +++ b/drivers/md/dm-dust.c
> > > @@ -138,20 +138,22 @@ static int dust_add_block(struct dust_device *dd, unsigned long long block,
> > >         return 0;
> > >  }
> > >
> > > -static int dust_query_block(struct dust_device *dd, unsigned long long block)
> > > +static int dust_query_block(struct dust_device *dd, unsigned long long block, char *result,
> > > +                           unsigned int maxlen, unsigned int *sz_ptr)
> > >  {
> > >         struct badblock *bblock;
> > >         unsigned long flags;
> > > +       unsigned int sz = *sz_ptr;
> > >
> > >         spin_lock_irqsave(&dd->dust_lock, flags);
> > >         bblock = dust_rb_search(&dd->badblocklist, block);
> > >         if (bblock != NULL)
> > > -               DMINFO("%s: block %llu found in badblocklist", __func__, block);
> > > +               DMEMIT("block %llu found in badblocklist", block);
> > >         else
> > > -               DMINFO("%s: block %llu not found in badblocklist", __func__, block);
> > > +               DMEMIT("block %llu not found in badblocklist", block);
> > >         spin_unlock_irqrestore(&dd->dust_lock, flags);
> > >
> > > -       return 0;
> > > +       return 1;
> >
> > First, thank you very much for this patch.  After the concerns to
> > convert some functions to use DMEMIT were brought up, I was trying to
> > start the conversion, when this patch arrived, so I installed it, and
> > tested it.
> >
> > I do have a question, though:
> >
> > First, I see that in dust_query_block() (above) and
> > dust_clear_badblocks(), the "return 0" statement is changed to "return
> > 1".
> >
> > (Additionally, there is a change from "r = 0" to  "r = 1", in the
> > "countbadblocks" message handler)
> >
> > On testing the functions, they still work, but why was this change
> > made?  Is it related to the use of DMEMIT?
>
> It is, but we need to review the returns closer.  Looked to me that 1
> was being returned even if nothing was DMEMIT()'d.. but I could be wrong
> (only looked quickly).
>
> I also noticed that some output was changed to not include __func__.
> Please review that the output reflects what you'd like displayed.
>
> Mike
>

After adding __func__ back into the string, here's what it looks like:

$ sudo dmsetup message dust1 0 addbadblock 60
$ sudo dmsetup message dust1 0 queryblock 60
dust_query_block: block 60 found in badblocklist
$ sudo dmsetup message dust1 0 queryblock 61
dust_query_block: block 61 not found in badblocklist

I feel that the output's origin is more clear, so I'd like to leave
__func__ in the output.

I took a look at the DMEMIT calls, and in all three cases, it looks
like there's something DMEMIT()'d:

dust_query_block: either "block found", or "block not found".
dust_clear_badblocks: either "no badblocks found", or "badblocks cleared".
result of "message ... countbadblocks": always prints "%llu badblocks found".


Thanks,

Bryan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

