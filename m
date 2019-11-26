Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D4B7F10A616
	for <lists+dm-devel@lfdr.de>; Tue, 26 Nov 2019 22:37:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574804268;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iRNBewFRPfhioa2hK/F1u92Inb2w9GxP/ZR2lostlj4=;
	b=L3HuxVSOAsbgGjwJzP1HPQPeDoSbOpl5RcbLlNA2TJEXIjGU1z4QQhLymgkAu6LhZOFSNg
	z/hS5FpiTL/LLs19NI/z04i67525JAZRMMAJUrfcjKErz/hbbCKR/9kNL0hQE9gCXIaT8Z
	XjLsPUkvQANGxU/p96DRYFs4LVU7vOE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-NRaH4Zc6NXyJizakZnwG4A-1; Tue, 26 Nov 2019 16:37:46 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC9CA80183C;
	Tue, 26 Nov 2019 21:37:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7607B1001902;
	Tue, 26 Nov 2019 21:37:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B99C91809567;
	Tue, 26 Nov 2019 21:37:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAQLbIoq027717 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 26 Nov 2019 16:37:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1F5F6F77AD; Tue, 26 Nov 2019 21:37:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B715F9AA3
	for <dm-devel@redhat.com>; Tue, 26 Nov 2019 21:37:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 892801024D0C
	for <dm-devel@redhat.com>; Tue, 26 Nov 2019 21:37:15 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-275-tEuUN62hNNij7kUV50SH3Q-1;
	Tue, 26 Nov 2019 16:37:11 -0500
Received: from lwn.net (localhost [127.0.0.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D3A9F2E7;
	Tue, 26 Nov 2019 21:37:09 +0000 (UTC)
Date: Tue, 26 Nov 2019 14:37:08 -0700
From: Jonathan Corbet <corbet@lwn.net>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20191126143708.1921e442@lwn.net>
In-Reply-To: <20191126201613.GA3750@redhat.com>
References: <20191126185627.970-1-geert+renesas@glider.be>
	<20191126201613.GA3750@redhat.com>
Organization: LWN.net
MIME-Version: 1.0
X-MC-Unique: tEuUN62hNNij7kUV50SH3Q-1
X-MC-Unique: NRaH4Zc6NXyJizakZnwG4A-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAQLbIoq027717
X-loop: dm-devel@redhat.com
Cc: Nikos Tsironis <ntsironis@arrikto.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ilias Tsitsimpis <iliastsi@arrikto.com>, dm-devel@redhat.com,
	Alasdair, Kergon <agk@redhat.com>
Subject: Re: [dm-devel] docs: device-mapper: Add dm-clone to documentation
	index
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
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 26 Nov 2019 15:16:13 -0500
Mike Snitzer <snitzer@redhat.com> wrote:

> I already staged this for 5.5 here:
> https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.5&id=484e0d2b11e1fdd0d17702b282eb2ed56148385f
> 
> But I don't plan to send to Linus for a week or 2...
> 
> If Jon and/or someone else would like to send it along before then
> that'd be fine with me.

It seems like things are well in hand to me, no need to do anything else.

Thanks,

jon


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

