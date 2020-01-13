Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 0ECE813A8C0
	for <lists+dm-devel@lfdr.de>; Tue, 14 Jan 2020 12:55:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579002953;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UOjPZxITcbkPKgfPW5CzPvBw7PwtapUJbvlkGHTklxU=;
	b=cmrxUyCQTQzLjBmb2ZZp1Z2255j6d/yEzRKYjO69wyq0oQ8+eTpgoWvkrL+KPdo3gvEkRy
	l/GusNl/ibnXfXb9nLqxQuzqErENVImQlaPRXiNTLIr8YWTnwljur25DvlNYm+MscMhXkM
	Po+Qb1ui23DpL2ttnpSI3YJUadocwlg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-CH_tlkKKMdicN08qVJVRWg-1; Tue, 14 Jan 2020 06:55:49 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63CFC107ACCD;
	Tue, 14 Jan 2020 11:55:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37F25842A9;
	Tue, 14 Jan 2020 11:55:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C6A7B87087;
	Tue, 14 Jan 2020 11:55:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00DIQ063003587 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 13 Jan 2020 13:26:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 91536D0B30; Mon, 13 Jan 2020 18:26:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D671D0B2B
	for <dm-devel@redhat.com>; Mon, 13 Jan 2020 18:25:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7579802823
	for <dm-devel@redhat.com>; Mon, 13 Jan 2020 18:25:58 +0000 (UTC)
Received: from mx009.vodafonemail.xion.oxcs.net
	(mx009.vodafonemail.xion.oxcs.net [153.92.174.39]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-70-tjLHE2WcOWylnBGep0AqBg-1;
	Mon, 13 Jan 2020 13:25:56 -0500
Received: from vsmx002.vodafonemail.xion.oxcs.net (unknown [192.168.75.192])
	by mta-6-out.mta.xion.oxcs.net (Postfix) with ESMTP id 8BB7C60576A;
	Mon, 13 Jan 2020 18:17:04 +0000 (UTC)
Received: from lazy.lzy (unknown [79.214.221.251])
	by mta-6-out.mta.xion.oxcs.net (Postfix) with ESMTPA id 3D7DD605B0C;
	Mon, 13 Jan 2020 18:16:55 +0000 (UTC)
Received: from lazy.lzy (localhost [127.0.0.1])
	by lazy.lzy (8.15.2/8.14.5) with ESMTPS id 00DIGsaA007701
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 13 Jan 2020 19:16:54 +0100
Received: (from red@localhost)
	by lazy.lzy (8.15.2/8.15.2/Submit) id 00DIGs1v007700;
	Mon, 13 Jan 2020 19:16:54 +0100
Date: Mon, 13 Jan 2020 19:16:54 +0100
From: Piergiorgio Sartor <piergiorgio.sartor@nexgo.de>
To: Song Liu <song@kernel.org>
Message-ID: <20200113181654.GA7645@lazy.lzy>
References: <CAJH6TXhnkB10BUENn0P+qXy4nunwY6QVtgDvaFVpfGDpvE-V=Q@mail.gmail.com>
	<CAPhsuW6srGADYYD4dsUbVVBcz4bfJ-taoOy6ccpXjyU26jVTEg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPhsuW6srGADYYD4dsUbVVBcz4bfJ-taoOy6ccpXjyU26jVTEg@mail.gmail.com>
X-VADE-STATUS: LEGIT
X-MC-Unique: tjLHE2WcOWylnBGep0AqBg-1
X-MC-Unique: CH_tlkKKMdicN08qVJVRWg-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00DIQ063003587
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
Content-Disposition: inline

On Mon, Jan 13, 2020 at 10:11:00AM -0800, Song Liu wrote:
> + dm-devel
> 
> On Sun, Jan 12, 2020 at 5:43 AM Gandalf Corvotempesta
> <gandalf.corvotempesta@gmail.com> wrote:
> >
> > I'm testing dm-integrity.
> > Simple question: when corrupted data are found, repair is done
> > immediately or on next scrub?
> >
> > This is what I have:
> >
> > [ 6727.395808] md: data-check of RAID array md0
> > [ 6727.528589] device-mapper: integrity: Checksum failed at sector 0xe228
> > [ 6727.938689] md: md0: data-check done.
> > [ 6749.125075] md: data-check of RAID array md0
> > [ 6749.664269] md: md0: data-check done.
> >
> > if repair is done immediatly, would be possible to add a single log
> > line saying that ?
> > something like:
> > [ 6727.528589] md: md0: Repaired data at sector 0xe228
> 
> I guess this belongs to dm-integrity instead of md?

Eh, well, no.
He is asking about "md" in case the underlying
layer, dm-integrity in this case, returns an error.

This could be the case also if the HDD returns
a read error which the RAID will correct and,
if I get it right, rewrite.

But I guess "md" already returns where the
correction happened, isn't like that?
I recall seeing in the logs something about
it, but it was some time ago...

bye,

-- 

piergiorgio


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

