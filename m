Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 8D86E13A8BD
	for <lists+dm-devel@lfdr.de>; Tue, 14 Jan 2020 12:55:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579002949;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eW8jrY1wAMs6sVR2u5mUy77UIuesQAWCZJUeg8wm5sA=;
	b=W5ZuwQLZLT6YUByyRTyxhWHd36PJ5s+UuJcyXZw5lNLjGoazNwC6PyFPHAo1yYN3YLSjJA
	lyA53VDeTnp64hBp0Jca859M6HYX0sbyzDml17Tl/zpNb6W0fl6biD/f8LzyGHkKJFaiJI
	ZRGkynMX5iGbjqysOHQvSs6+o5GMZHk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-ofB3XcF7PRWJEY-7Y9h44Q-1; Tue, 14 Jan 2020 06:55:47 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64359800A02;
	Tue, 14 Jan 2020 11:55:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 805FF88866;
	Tue, 14 Jan 2020 11:55:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C9CDF1803C33;
	Tue, 14 Jan 2020 11:55:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00DIBI9C002848 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 13 Jan 2020 13:11:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E9FF4D0B27; Mon, 13 Jan 2020 18:11:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4BC6D0B2B
	for <dm-devel@redhat.com>; Mon, 13 Jan 2020 18:11:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20EBD185B0A2
	for <dm-devel@redhat.com>; Mon, 13 Jan 2020 18:11:16 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-107-dPUDbJAiPUCe8gYDkLNOBA-1;
	Mon, 13 Jan 2020 13:11:13 -0500
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
	[209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 3B103207FD
	for <dm-devel@redhat.com>; Mon, 13 Jan 2020 18:11:12 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id u1so4408726qvk.13
	for <dm-devel@redhat.com>; Mon, 13 Jan 2020 10:11:12 -0800 (PST)
X-Gm-Message-State: APjAAAWIqvMaXmVewI4IEdC7iQeho3aNraTgdVopJPIb2L1JWOkiJMuV
	g0d6iGmyfhRl78T/1pGhJS6ErkZxnLEx7FJCHnc=
X-Google-Smtp-Source: APXvYqz+oKiylZsxefdGOBUU5aYMjPqCBWQ8EdkHjQlWisvN9+c+ok6tleuOYp2t+OB3htNMcJCufAxPWFR4zGOVEkM=
X-Received: by 2002:a05:6214:14a6:: with SMTP id
	bo6mr17126975qvb.8.1578939071432; 
	Mon, 13 Jan 2020 10:11:11 -0800 (PST)
MIME-Version: 1.0
References: <CAJH6TXhnkB10BUENn0P+qXy4nunwY6QVtgDvaFVpfGDpvE-V=Q@mail.gmail.com>
In-Reply-To: <CAJH6TXhnkB10BUENn0P+qXy4nunwY6QVtgDvaFVpfGDpvE-V=Q@mail.gmail.com>
From: Song Liu <song@kernel.org>
Date: Mon, 13 Jan 2020 10:11:00 -0800
X-Gmail-Original-Message-ID: <CAPhsuW6srGADYYD4dsUbVVBcz4bfJ-taoOy6ccpXjyU26jVTEg@mail.gmail.com>
Message-ID: <CAPhsuW6srGADYYD4dsUbVVBcz4bfJ-taoOy6ccpXjyU26jVTEg@mail.gmail.com>
To: Gandalf Corvotempesta <gandalf.corvotempesta@gmail.com>,
	dm-devel@redhat.com
X-MC-Unique: dPUDbJAiPUCe8gYDkLNOBA-1
X-MC-Unique: ofB3XcF7PRWJEY-7Y9h44Q-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00DIBI9C002848
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 14 Jan 2020 06:55:09 -0500
Cc: Linux RAID Mailing List <linux-raid@vger.kernel.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

+ dm-devel

On Sun, Jan 12, 2020 at 5:43 AM Gandalf Corvotempesta
<gandalf.corvotempesta@gmail.com> wrote:
>
> I'm testing dm-integrity.
> Simple question: when corrupted data are found, repair is done
> immediately or on next scrub?
>
> This is what I have:
>
> [ 6727.395808] md: data-check of RAID array md0
> [ 6727.528589] device-mapper: integrity: Checksum failed at sector 0xe228
> [ 6727.938689] md: md0: data-check done.
> [ 6749.125075] md: data-check of RAID array md0
> [ 6749.664269] md: md0: data-check done.
>
> if repair is done immediatly, would be possible to add a single log
> line saying that ?
> something like:
> [ 6727.528589] md: md0: Repaired data at sector 0xe228

I guess this belongs to dm-integrity instead of md?

Thanks,
Song


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

