Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 31D352019B0
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 19:46:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592588813;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=L3l91QRmUT5kbyAC1BAYrupr68PxesndWiOkMwoZ9I0=;
	b=IxStRaNbyv8mvmDhYci2kemQSNwakC4Wc7wyuXUDISbnsA4c4i61LBgRq5uS2pBsO7EOYh
	b3dRfiABPj+CXo1UgWHAbBG4ODdaFwbHNL2LovzqxDHi69frsI7vfkDMLfsmVGH9+AQ2VA
	KDLab2u7LKFJ5bXrk8hHcIhLWRgwC3I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-uTFQnt_1P7yUR3_aayQXhg-1; Fri, 19 Jun 2020 13:46:50 -0400
X-MC-Unique: uTFQnt_1P7yUR3_aayQXhg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F58F801A03;
	Fri, 19 Jun 2020 17:46:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FDE371661;
	Fri, 19 Jun 2020 17:46:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 722761809557;
	Fri, 19 Jun 2020 17:46:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JHi5GO005536 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 13:44:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A9610202696C; Fri, 19 Jun 2020 17:44:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A50DA2026D67
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 17:44:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E94E101A526
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 17:44:03 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
	[209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-190-_s1gulu3PO2JKBLkYoE0Pw-1; Fri, 19 Jun 2020 13:43:58 -0400
X-MC-Unique: _s1gulu3PO2JKBLkYoE0Pw-1
Received: by mail-wr1-f72.google.com with SMTP id e1so4623439wrm.3
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 10:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hx7f7Hmrx+99ZzNPanGaMmvcTLeyUIgLaenzNG+hYg4=;
	b=eSc7T75382NlyHUdJLgmyZXB6NLdQo46QLg3wuQmw6zuC6RgtDmIqBwcVH8oOZjt8i
	BMeoTqz8C39QPguz9hbzG2f54Dpq1+h0DLJPBYVgtRcz0+3DHQfsPZLssjeXDmED+Mns
	oo2JnY5ZZ+Pz5LYXYj81qYu/hUgzLCWO53pUOIxIHmQCzZmRdqejnOeWkgOWHqxMA0up
	Kwl9LofD/TVMokawwhtS3m8hhr9gV5dQpWYViprrJSF6QmuLTxL09Lvm1W1uXOprRhOa
	iwvWETiRxXKaWUhmkcjGb4FPNAbHsl2eyoiQgXrGiS7BfLHeSGkpS7S/1eqzIzqchETr
	AdGw==
X-Gm-Message-State: AOAM532s/QnWVpToiQXPR3f7OWhzmLs+3SyGAgIXyIzPcN9DpAuo3QZF
	wBPWILuTebbvD3zjBq8RR7YUBAYWE1vPjPikY/fVH/PnbjGjIUPxu8mBTs2PgszKlISwE3abUKH
	BlEi8sSNGNYnkpjUZfZTFBuxsXH4t2DI=
X-Received: by 2002:adf:f083:: with SMTP id n3mr5266427wro.297.1592588636877; 
	Fri, 19 Jun 2020 10:43:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxN24ZCQctOIlpNUtc0t4NkntrfqHXlgCbuLCfCZ74SJxsTFSo6vmC5webu2oZXlqsjLQNMqKHIMF/mP9Fy3yM=
X-Received: by 2002:adf:f083:: with SMTP id n3mr5266406wro.297.1592588636674; 
	Fri, 19 Jun 2020 10:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200619123803.1441373-1-yangerkun@huawei.com>
	<20200619123803.1441373-2-yangerkun@huawei.com>
	<CAHhmqcTdxeTrpBuJBLqch9FzYuv=k+73fOjStsd-NmoDRyFffQ@mail.gmail.com>
	<20200619154445.GA24500@redhat.com>
	<CAHhmqcSB_bd8dO75pQny=MxNxd1=3mpHDCtX_faiO2VUFx616w@mail.gmail.com>
	<20200619172947.GA24951@redhat.com>
In-Reply-To: <20200619172947.GA24951@redhat.com>
From: Bryan Gurney <bgurney@redhat.com>
Date: Fri, 19 Jun 2020 13:43:45 -0400
Message-ID: <CAHhmqcTJgDPBg8YOtrxtJW1ONkz8pz=nqZa-EXM84=dcQ165Fg@mail.gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 19, 2020 at 1:29 PM Mike Snitzer <snitzer@redhat.com> wrote:
>
> On Fri, Jun 19 2020 at  1:23pm -0400,
> Bryan Gurney <bgurney@redhat.com> wrote:
>
> > On Fri, Jun 19, 2020 at 11:45 AM Mike Snitzer <snitzer@redhat.com> wrote:
> > >
> > > On Fri, Jun 19 2020 at 11:40am -0400,
> > > Bryan Gurney <bgurney@redhat.com> wrote:
> > >
> > > > On Fri, Jun 19, 2020 at 8:37 AM yangerkun <yangerkun@huawei.com> wrote:
> > > > >
> > > > > Some type of message(queryblock/countbadblocks/removebadblock) may better
> > > > > report results to user directly. Do it with DMEMIT.
> > > > >
> > > > > Signed-off-by: yangerkun <yangerkun@huawei.com>
> > > > > ---
> > > > >  drivers/md/dm-dust.c | 31 ++++++++++++++++++-------------
> > > > >  1 file changed, 18 insertions(+), 13 deletions(-)
> > > > >
> > > > > diff --git a/drivers/md/dm-dust.c b/drivers/md/dm-dust.c
> > > > > index ff03b90072c5..a0c75c104de0 100644
> > > > > --- a/drivers/md/dm-dust.c
> > > > > +++ b/drivers/md/dm-dust.c
> > > > > @@ -138,20 +138,22 @@ static int dust_add_block(struct dust_device *dd, unsigned long long block,
> > > > >         return 0;
> > > > >  }
> > > > >
> > > > > -static int dust_query_block(struct dust_device *dd, unsigned long long block)
> > > > > +static int dust_query_block(struct dust_device *dd, unsigned long long block, char *result,
> > > > > +                           unsigned int maxlen, unsigned int *sz_ptr)
> > > > >  {
> > > > >         struct badblock *bblock;
> > > > >         unsigned long flags;
> > > > > +       unsigned int sz = *sz_ptr;
> > > > >
> > > > >         spin_lock_irqsave(&dd->dust_lock, flags);
> > > > >         bblock = dust_rb_search(&dd->badblocklist, block);
> > > > >         if (bblock != NULL)
> > > > > -               DMINFO("%s: block %llu found in badblocklist", __func__, block);
> > > > > +               DMEMIT("block %llu found in badblocklist", block);
> > > > >         else
> > > > > -               DMINFO("%s: block %llu not found in badblocklist", __func__, block);
> > > > > +               DMEMIT("block %llu not found in badblocklist", block);
> > > > >         spin_unlock_irqrestore(&dd->dust_lock, flags);
> > > > >
> > > > > -       return 0;
> > > > > +       return 1;
> > > >
> > > > First, thank you very much for this patch.  After the concerns to
> > > > convert some functions to use DMEMIT were brought up, I was trying to
> > > > start the conversion, when this patch arrived, so I installed it, and
> > > > tested it.
> > > >
> > > > I do have a question, though:
> > > >
> > > > First, I see that in dust_query_block() (above) and
> > > > dust_clear_badblocks(), the "return 0" statement is changed to "return
> > > > 1".
> > > >
> > > > (Additionally, there is a change from "r = 0" to  "r = 1", in the
> > > > "countbadblocks" message handler)
> > > >
> > > > On testing the functions, they still work, but why was this change
> > > > made?  Is it related to the use of DMEMIT?
> > >
> > > It is, but we need to review the returns closer.  Looked to me that 1
> > > was being returned even if nothing was DMEMIT()'d.. but I could be wrong
> > > (only looked quickly).
> > >
> > > I also noticed that some output was changed to not include __func__.
> > > Please review that the output reflects what you'd like displayed.
> > >
> > > Mike
> > >
> >
> > After adding __func__ back into the string, here's what it looks like:
> >
> > $ sudo dmsetup message dust1 0 addbadblock 60
> > $ sudo dmsetup message dust1 0 queryblock 60
> > dust_query_block: block 60 found in badblocklist
> > $ sudo dmsetup message dust1 0 queryblock 61
> > dust_query_block: block 61 not found in badblocklist
> >
> > I feel that the output's origin is more clear, so I'd like to leave
> > __func__ in the output.
> >
> > I took a look at the DMEMIT calls, and in all three cases, it looks
> > like there's something DMEMIT()'d:
> >
> > dust_query_block: either "block found", or "block not found".
> > dust_clear_badblocks: either "no badblocks found", or "badblocks cleared".
> > result of "message ... countbadblocks": always prints "%llu badblocks found".
>
> OK, can you provide an incremental patch that restores the __func__
> where you'd like?  I can deal with it, but I'll be slower to do so.
>
> Mike
>

Yes, I just sent the patch to dm-devel.


Thanks,

Bryan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

