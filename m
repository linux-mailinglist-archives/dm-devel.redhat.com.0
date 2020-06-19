Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF1E201A31
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 20:22:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592590929;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DmVjrOVHBRTQK1w7jbvGc+WkLAMg44pZ85IxeBEMM6M=;
	b=JBuTa8AaYK9JgUVBHfOtZ/9JUF2p3UfkYe+COth0wsOrRx1h2KsvYKV7zWtpKU8ltW8DGq
	aERLbxHqyNN9F7seSX2w8VgseQ6l6X7GHLPVC1VD7m/OMl7OBQcvXWO5SXMjbIz2MkWV50
	thbFDj+06A5FZpcnDPsWCbxnV9xqUSE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-GoHJgX-8PJ6TmDW3xCP9_A-1; Fri, 19 Jun 2020 14:22:06 -0400
X-MC-Unique: GoHJgX-8PJ6TmDW3xCP9_A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4020B1005512;
	Fri, 19 Jun 2020 18:21:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E515C1C8;
	Fri, 19 Jun 2020 18:21:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5DE611809547;
	Fri, 19 Jun 2020 18:21:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JILhaw012174 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 14:21:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 28067107282; Fri, 19 Jun 2020 18:21:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22737103CD8
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 18:21:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6A32185A78B
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 18:21:40 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
	[209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-159-NM9E_AlGMM2rz7VKTGgfAA-1; Fri, 19 Jun 2020 14:21:38 -0400
X-MC-Unique: NM9E_AlGMM2rz7VKTGgfAA-1
Received: by mail-wm1-f69.google.com with SMTP id x6so4341067wmj.9
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 11:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HkIeNjYrjP6Zb4FoxahPcZnFFc44RaovAzvO4PTYotk=;
	b=Y8b92iztWXmmP80LQI6aGq3M71C10vYE+2/Sq9r6T7d7zQit0MycyMPDu/wDto8fsR
	2Uy4kgzt5yrgHew+df7NBrCPikOhz30EPgOH0fr8ddFEn8p7kW3Ey6oAnzMnsejSr5h4
	ASe3FM4bklzRYavJxIw6Cf8b38ZVBGyU88cjFP2FTYHOx4FXzkuAir97qGUcIhQn8iG2
	W406Gzqh0sMamxrbAzMgyOFfAWWaV1snAQ3n5MygIgX/6ckXvSnl2uA9VoSKtYquqybV
	lXu3wFbB9TVz5lkUzqqKvbpmxxIOywxgnQUTCd8TlgvQCsUrdjo6X6mAFOqgLmO/k/Wx
	aqFw==
X-Gm-Message-State: AOAM531SZUsaWnduIoe6xaiSgMj1JBTRDdc+kufHb5jQkRThsngCWN+d
	+G8cW9B9HfHhqDoHMdIhH1CqE2JyS5yRfdRcAIKxcmuN98pwstrgv1I35EtvOiK7h4uCIJI9VQU
	9dFaTwRnJ2X+j5lJOCttPGqhwt6tLIHs=
X-Received: by 2002:adf:9022:: with SMTP id h31mr1884301wrh.181.1592590897579; 
	Fri, 19 Jun 2020 11:21:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWanXK+5DgedSvtXqXv4E4sDQuwduvmCEhcuoktJIgGf3J4YFSNnURc9Gr3b/P89BdCh1ns1wY1ooPVRT0cso=
X-Received: by 2002:adf:9022:: with SMTP id h31mr1884288wrh.181.1592590897352; 
	Fri, 19 Jun 2020 11:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200619123803.1441373-1-yangerkun@huawei.com>
	<20200619123803.1441373-2-yangerkun@huawei.com>
	<CAHhmqcTdxeTrpBuJBLqch9FzYuv=k+73fOjStsd-NmoDRyFffQ@mail.gmail.com>
	<20200619154445.GA24500@redhat.com>
	<CAHhmqcSB_bd8dO75pQny=MxNxd1=3mpHDCtX_faiO2VUFx616w@mail.gmail.com>
	<20200619172947.GA24951@redhat.com>
	<CAHhmqcTJgDPBg8YOtrxtJW1ONkz8pz=nqZa-EXM84=dcQ165Fg@mail.gmail.com>
In-Reply-To: <CAHhmqcTJgDPBg8YOtrxtJW1ONkz8pz=nqZa-EXM84=dcQ165Fg@mail.gmail.com>
From: Bryan Gurney <bgurney@redhat.com>
Date: Fri, 19 Jun 2020 14:21:26 -0400
Message-ID: <CAHhmqcQt9OEcvHKmBygRcTq_FRZ2RC5rGFqXqARnz0y623xfWA@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 19, 2020 at 1:43 PM Bryan Gurney <bgurney@redhat.com> wrote:
>
> On Fri, Jun 19, 2020 at 1:29 PM Mike Snitzer <snitzer@redhat.com> wrote:
> >
> > On Fri, Jun 19 2020 at  1:23pm -0400,
> > Bryan Gurney <bgurney@redhat.com> wrote:
> >
> > > On Fri, Jun 19, 2020 at 11:45 AM Mike Snitzer <snitzer@redhat.com> wrote:
> > > >
> > > > On Fri, Jun 19 2020 at 11:40am -0400,
> > > > Bryan Gurney <bgurney@redhat.com> wrote:
> > > >
> > > > > On Fri, Jun 19, 2020 at 8:37 AM yangerkun <yangerkun@huawei.com> wrote:
> > > > > >
> > > > > > Some type of message(queryblock/countbadblocks/removebadblock) may better
> > > > > > report results to user directly. Do it with DMEMIT.
> > > > > >
> > > > > > Signed-off-by: yangerkun <yangerkun@huawei.com>
> > > > > > ---
> > > > > >  drivers/md/dm-dust.c | 31 ++++++++++++++++++-------------
> > > > > >  1 file changed, 18 insertions(+), 13 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/md/dm-dust.c b/drivers/md/dm-dust.c
> > > > > > index ff03b90072c5..a0c75c104de0 100644
> > > > > > --- a/drivers/md/dm-dust.c
> > > > > > +++ b/drivers/md/dm-dust.c
> > > > > > @@ -138,20 +138,22 @@ static int dust_add_block(struct dust_device *dd, unsigned long long block,
> > > > > >         return 0;
> > > > > >  }
> > > > > >
> > > > > > -static int dust_query_block(struct dust_device *dd, unsigned long long block)
> > > > > > +static int dust_query_block(struct dust_device *dd, unsigned long long block, char *result,
> > > > > > +                           unsigned int maxlen, unsigned int *sz_ptr)
> > > > > >  {
> > > > > >         struct badblock *bblock;
> > > > > >         unsigned long flags;
> > > > > > +       unsigned int sz = *sz_ptr;
> > > > > >
> > > > > >         spin_lock_irqsave(&dd->dust_lock, flags);
> > > > > >         bblock = dust_rb_search(&dd->badblocklist, block);
> > > > > >         if (bblock != NULL)
> > > > > > -               DMINFO("%s: block %llu found in badblocklist", __func__, block);
> > > > > > +               DMEMIT("block %llu found in badblocklist", block);
> > > > > >         else
> > > > > > -               DMINFO("%s: block %llu not found in badblocklist", __func__, block);
> > > > > > +               DMEMIT("block %llu not found in badblocklist", block);
> > > > > >         spin_unlock_irqrestore(&dd->dust_lock, flags);
> > > > > >
> > > > > > -       return 0;
> > > > > > +       return 1;
> > > > >
> > > > > First, thank you very much for this patch.  After the concerns to
> > > > > convert some functions to use DMEMIT were brought up, I was trying to
> > > > > start the conversion, when this patch arrived, so I installed it, and
> > > > > tested it.
> > > > >
> > > > > I do have a question, though:
> > > > >
> > > > > First, I see that in dust_query_block() (above) and
> > > > > dust_clear_badblocks(), the "return 0" statement is changed to "return
> > > > > 1".
> > > > >
> > > > > (Additionally, there is a change from "r = 0" to  "r = 1", in the
> > > > > "countbadblocks" message handler)
> > > > >
> > > > > On testing the functions, they still work, but why was this change
> > > > > made?  Is it related to the use of DMEMIT?
> > > >
> > > > It is, but we need to review the returns closer.  Looked to me that 1
> > > > was being returned even if nothing was DMEMIT()'d.. but I could be wrong
> > > > (only looked quickly).
> > > >
> > > > I also noticed that some output was changed to not include __func__.
> > > > Please review that the output reflects what you'd like displayed.
> > > >
> > > > Mike
> > > >
> > >
> > > After adding __func__ back into the string, here's what it looks like:
> > >
> > > $ sudo dmsetup message dust1 0 addbadblock 60
> > > $ sudo dmsetup message dust1 0 queryblock 60
> > > dust_query_block: block 60 found in badblocklist
> > > $ sudo dmsetup message dust1 0 queryblock 61
> > > dust_query_block: block 61 not found in badblocklist
> > >
> > > I feel that the output's origin is more clear, so I'd like to leave
> > > __func__ in the output.
> > >
> > > I took a look at the DMEMIT calls, and in all three cases, it looks
> > > like there's something DMEMIT()'d:
> > >
> > > dust_query_block: either "block found", or "block not found".
> > > dust_clear_badblocks: either "no badblocks found", or "badblocks cleared".
> > > result of "message ... countbadblocks": always prints "%llu badblocks found".
> >
> > OK, can you provide an incremental patch that restores the __func__
> > where you'd like?  I can deal with it, but I'll be slower to do so.
> >
> > Mike
> >
>
> Yes, I just sent the patch to dm-devel.
>
>
> Thanks,
>
> Bryan

I'm going to work on folding the review changes above into a v4 series.


Thanks,

Bryan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

