Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD5C45B0FA
	for <lists+dm-devel@lfdr.de>; Wed, 24 Nov 2021 02:05:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637715912;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LA17sTLpEIHbGDBQhhjtbUbI6c9sPuUEQ6TCEd3AW/A=;
	b=A5GTHqR7sBN/3KucMzwXK8ebaFSuD7pJCO7Pp4hJKJ92fAYaufCpdnekjk87d5Vi1xhCcA
	44VA62rRTnnSMgWP/HcojX2sYdZeyVdX4gNodGqNw5j5aWiKxMpndscO8ckO4rPTOE5B0Y
	1vb5pQvfkcTVsarlecyoX1mkdCDy+y8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-D3U890KTPcKy2pS_SGo5TA-1; Tue, 23 Nov 2021 20:05:08 -0500
X-MC-Unique: D3U890KTPcKy2pS_SGo5TA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAD031853026;
	Wed, 24 Nov 2021 01:05:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7733060C7F;
	Wed, 24 Nov 2021 01:05:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E40014A703;
	Wed, 24 Nov 2021 01:04:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AO14iaF007976 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 23 Nov 2021 20:04:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 70C0560C25; Wed, 24 Nov 2021 01:04:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from agk-cloud1.hosts.prod.upshift.rdu2.redhat.com
	(agk-cloud1.hosts.prod.upshift.rdu2.redhat.com [10.0.13.154])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9CA165DF5E;
	Wed, 24 Nov 2021 01:04:36 +0000 (UTC)
Received: by agk-cloud1.hosts.prod.upshift.rdu2.redhat.com (Postfix,
	from userid 3883)
	id B39B0424F08E; Wed, 24 Nov 2021 01:02:39 +0000 (GMT)
Date: Wed, 24 Nov 2021 01:02:39 +0000
From: Alasdair G Kergon <agk@redhat.com>
To: Akilesh Kailash <akailash@google.com>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Mike Snitzer <msnitzer@redhat.com>, Alasdair Kergon <agk@redhat.com>,
	Jonathan Brassow <jbrassow@redhat.com>,
	Heinz Mauelshagen <heinzm@redhat.com>,
	David Anderson <dvander@google.com>, dm-devel@redhat.com
Message-ID: <20211124010239.GC63964@agk-cloud1.hosts.prod.upshift.rdu2.redhat.com>
Mail-Followup-To: Akilesh Kailash <akailash@google.com>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Mike Snitzer <msnitzer@redhat.com>,
	Alasdair Kergon <agk@redhat.com>,
	Jonathan Brassow <jbrassow@redhat.com>,
	Heinz Mauelshagen <heinzm@redhat.com>,
	David Anderson <dvander@google.com>, dm-devel@redhat.com
References: <alpine.LRH.2.02.2111231421490.24195@file01.intranet.prod.int.rdu2.redhat.com>
	<CABSDvDL23UZ8KMrjK+qm0Lw0bfDaWh2TruZ2kLgGXqidgOt0jQ@mail.gmail.com>
	<20211124003831.GB63964@agk-cloud1.hosts.prod.upshift.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211124003831.GB63964@agk-cloud1.hosts.prod.upshift.rdu2.redhat.com>
Organization: Red Hat UK Ltd. Registered in England and Wales, number
	03798903. Registered Office: Amberley Place, 107-111 Peascod Street,
	Windsor, Berkshire, SL4 1TE.
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] announcing the dm-update target
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 24, 2021 at 12:38:31AM +0000, Alasdair G Kergon wrote:
> There seems to be a general industry movement towards edge, attestation,
> trusted boot, nested systems, confidential computing, containers,
> <insert your favourite buzzwords> etc. and I think this type of
> device-mapper target might play a useful role as one of the low-level
> components involved in building up support for some of those scenarios.
> (Just as we recently began adding support for attestation.)

For example, I think we've already made good progress towards
standardising the industry around dm-verity.  (At least, I keep
on encountering it being used in various different places, rather
than people attempting to develop their own version.)  We extended
that concept with dm-integrity but I'm less sure about how widely
that has been taken up so far.

For edge systems needing unattended remote reliable updates, our
high-level challenge here is: Can we together develop a decent and
efficient solution for OTA updates that the industry will be happy to
standardise around?

Alasdair

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

