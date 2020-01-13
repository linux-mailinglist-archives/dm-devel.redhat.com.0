Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B6BFD13A8BE
	for <lists+dm-devel@lfdr.de>; Tue, 14 Jan 2020 12:55:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579002949;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fGtJavZOQZPh4+zltIchkTdxn04EEae+gK2V12Ue5Ns=;
	b=NcMf7MJ/AYnJiuQngjOEXQ4S72ZlJuRhHVbKiu7ZRz5IAzb5BFTkJjsFb2n+gWNOy5VcIE
	kNTj3spKF8PWSCf6r2SzFUGCMUJYaW0ZJtXaWcqlYmAA1+v+leLx/g7F5C9fRRMail9Ui2
	u5VbvMErPo1o+2LQjN9dyZOWReQsrzo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-W3kfXU6SM1OatYa_kxeQhw-1; Tue, 14 Jan 2020 06:55:47 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65051DBA6;
	Tue, 14 Jan 2020 11:55:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82D4382E5E;
	Tue, 14 Jan 2020 11:55:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CDBC187084;
	Tue, 14 Jan 2020 11:55:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00DIwQaE005072 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 13 Jan 2020 13:58:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1A90B9C61B; Mon, 13 Jan 2020 18:58:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16D86A2898
	for <dm-devel@redhat.com>; Mon, 13 Jan 2020 18:58:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C7CC80209C
	for <dm-devel@redhat.com>; Mon, 13 Jan 2020 18:58:24 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-379-8P6B5v6dMYCZwYvxGfqYDw-1;
	Mon, 13 Jan 2020 13:58:21 -0500
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
	[209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4043021569
	for <dm-devel@redhat.com>; Mon, 13 Jan 2020 18:58:17 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id t129so9523736qke.10
	for <dm-devel@redhat.com>; Mon, 13 Jan 2020 10:58:17 -0800 (PST)
X-Gm-Message-State: APjAAAUmpX+SivjLstdpGv4ZxZBIprM14XIqPrQINJ34CHJA89DhrvOe
	bi8LoyRdNy8DO91NX7ZILGb0+hMmNXhi1lEfyew=
X-Google-Smtp-Source: APXvYqxJD+lg5C1nxFDdSFSNMWYGctFhnUOJ/chrc6TUbPdMXrP982xYSzTEub2/HHgK2eEHq9fkvkTtQapfOf49YDg=
X-Received: by 2002:a37:9dcd:: with SMTP id
	g196mr17794925qke.168.1578941896376; 
	Mon, 13 Jan 2020 10:58:16 -0800 (PST)
MIME-Version: 1.0
References: <CAJH6TXhnkB10BUENn0P+qXy4nunwY6QVtgDvaFVpfGDpvE-V=Q@mail.gmail.com>
	<CAPhsuW6srGADYYD4dsUbVVBcz4bfJ-taoOy6ccpXjyU26jVTEg@mail.gmail.com>
	<20200113181654.GA7645@lazy.lzy>
In-Reply-To: <20200113181654.GA7645@lazy.lzy>
From: Song Liu <song@kernel.org>
Date: Mon, 13 Jan 2020 10:58:05 -0800
X-Gmail-Original-Message-ID: <CAPhsuW6urOBa5s9od-znfn9J2jhz3cCOxmqu6tABvyoCEx5BHQ@mail.gmail.com>
Message-ID: <CAPhsuW6urOBa5s9od-znfn9J2jhz3cCOxmqu6tABvyoCEx5BHQ@mail.gmail.com>
To: Piergiorgio Sartor <piergiorgio.sartor@nexgo.de>
X-MC-Unique: 8P6B5v6dMYCZwYvxGfqYDw-1
X-MC-Unique: W3kfXU6SM1OatYa_kxeQhw-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00DIwQaE005072
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 14 Jan 2020 06:55:09 -0500
Cc: Linux RAID Mailing List <linux-raid@vger.kernel.org>, dm-devel@redhat.com,
	Gandalf Corvotempesta <gandalf.corvotempesta@gmail.com>
Subject: Re: [dm-devel] dm-integrity
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 13, 2020 at 10:17 AM Piergiorgio Sartor
<piergiorgio.sartor@nexgo.de> wrote:
>
> On Mon, Jan 13, 2020 at 10:11:00AM -0800, Song Liu wrote:
> > + dm-devel
> >
> > On Sun, Jan 12, 2020 at 5:43 AM Gandalf Corvotempesta
> > <gandalf.corvotempesta@gmail.com> wrote:
> > >
> > > I'm testing dm-integrity.
> > > Simple question: when corrupted data are found, repair is done
> > > immediately or on next scrub?
> > >
> > > This is what I have:
> > >
> > > [ 6727.395808] md: data-check of RAID array md0
> > > [ 6727.528589] device-mapper: integrity: Checksum failed at sector 0xe228
> > > [ 6727.938689] md: md0: data-check done.
> > > [ 6749.125075] md: data-check of RAID array md0
> > > [ 6749.664269] md: md0: data-check done.
> > >
> > > if repair is done immediatly, would be possible to add a single log
> > > line saying that ?
> > > something like:
> > > [ 6727.528589] md: md0: Repaired data at sector 0xe228
> >
> > I guess this belongs to dm-integrity instead of md?
>
> Eh, well, no.
> He is asking about "md" in case the underlying
> layer, dm-integrity in this case, returns an error.
>
> This could be the case also if the HDD returns
> a read error which the RAID will correct and,
> if I get it right, rewrite.

I see. Thanks for the clarification.

>
> But I guess "md" already returns where the
> correction happened, isn't like that?
> I recall seeing in the logs something about
> it, but it was some time ago...

Right now, md_done_sync() doesn't really print any message. I think this is
easy to add. However, md check/recovery is at block granularity, so we
probably cannot print exact which sector got fixed.

Thanks,
Song


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

