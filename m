Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8BFF5216F82
	for <lists+dm-devel@lfdr.de>; Tue,  7 Jul 2020 16:58:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594133921;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mNd6jT2XlLQByfEJGVSvdpL/cdPGLsUGyu3X5xacRYE=;
	b=fHK0HgckkcYDoBYECGWmqdHF7MoAFpyIJfZSOgDT7IB91uCPn8uQZZ9VWW/eP+IxEHEbKq
	1UoFyfvqLpUG+QGIOo5kVsXl30R8P2DfqdoeWdF0WOzrI7CeMpiyMUNYiN9G+s+nMLUlHi
	IzDQEgnmBYAJ+MXEnIrwTpZiT7OCHwA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-ZIuDvysJNtejjuOgZN1yug-1; Tue, 07 Jul 2020 10:58:39 -0400
X-MC-Unique: ZIuDvysJNtejjuOgZN1yug-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3A3618829C7;
	Tue,  7 Jul 2020 14:58:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7A4BC0061;
	Tue,  7 Jul 2020 14:58:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F125672F48;
	Tue,  7 Jul 2020 14:58:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 067Ew447029216 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 7 Jul 2020 10:58:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 834755C1BB; Tue,  7 Jul 2020 14:58:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AD335C1B2;
	Tue,  7 Jul 2020 14:58:01 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 067Ew1T3013602; Tue, 7 Jul 2020 10:58:01 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 067Ew1xA013598; Tue, 7 Jul 2020 10:58:01 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 7 Jul 2020 10:58:00 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Eric Biggers <ebiggers@kernel.org>
In-Reply-To: <20200706185403.GA736284@gmail.com>
Message-ID: <alpine.LRH.2.02.2007071049240.13237@file01.intranet.prod.int.rdu2.redhat.com>
References: <20200701045217.121126-1-ebiggers@kernel.org>
	<alpine.LRH.2.02.2007010358390.6597@file01.intranet.prod.int.rdu2.redhat.com>
	<20200706185403.GA736284@gmail.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, linux-crypto@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 0/6] crypto: add CRYPTO_ALG_ALLOCATES_MEMORY
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Mon, 6 Jul 2020, Eric Biggers wrote:

> On Wed, Jul 01, 2020 at 03:59:10AM -0400, Mikulas Patocka wrote:
> > Thanks for cleaning this up.
> > 
> > Mikulas
> 
> Do you have any real comments on this?
> 
> Are the usage restrictions okay for dm-crypt?
> 
> - Eric

I think that your patch series is OK.

dm-crypt submits crypto requests with size aligned on 512 bytes. The start 
of the crypto request is usually aligned on 512 bytes, but not always - 
XFS with SLUB_DEBUG will send bios with misaligned bv_offset (but the bio 
vectors don't cross a page).

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

