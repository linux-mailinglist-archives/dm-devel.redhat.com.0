Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B078A7294F7
	for <lists+dm-devel@lfdr.de>; Fri,  9 Jun 2023 11:25:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686302745;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=diN7BtfkmW1Y+jdKpndJF8hovNhL5cHkFxPDL3qlBXI=;
	b=KD/S+279XqCJbWNHOs8mysNfUA5KMSzaMQmoZ/A/V2FvQseZULe6T+TGvR3iQ62XP2I+/F
	PF+/0tAy8GKO4/xPMAUczTBod+L2AqFYySOaZQWFindOllZUDB5/GpNC9M2ziEoPsYF89S
	iY3hx4N1gSJOwJFY2z/NrAvicx1kp4I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-2jR8bHUYM3yszqaZPqpl0w-1; Fri, 09 Jun 2023 05:25:44 -0400
X-MC-Unique: 2jR8bHUYM3yszqaZPqpl0w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECD66801182;
	Fri,  9 Jun 2023 09:25:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E280640CFD46;
	Fri,  9 Jun 2023 09:25:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6F6D319451C8;
	Fri,  9 Jun 2023 09:25:31 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3B481194658C
 for <dm-devel@listman.corp.redhat.com>; Fri,  9 Jun 2023 09:25:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 16D45C16047; Fri,  9 Jun 2023 09:25:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net (unknown
 [10.67.24.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ADA0AC16044;
 Fri,  9 Jun 2023 09:25:17 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1q7YMr-000wbF-87; Fri, 09 Jun 2023 17:25:14 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 09 Jun 2023 17:25:13 +0800
Date: Fri, 9 Jun 2023 17:25:13 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Mike Snitzer <snitzer@kernel.org>
Message-ID: <ZILv+U3B7izgtJAZ@gondor.apana.org.au>
References: <ZHhbL+SbWRnTW4b7@gondor.apana.org.au>
 <ZHjtGvf+gHxeV83V@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ZHjtGvf+gHxeV83V@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [dm-devel] dm crypt: Avoid using MAX_CIPHER_BLOCKSIZE
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: dm-devel@redhat.com,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Alasdair Kergon <agk@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gondor.apana.org.au
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jun 01, 2023 at 03:10:18PM -0400, Mike Snitzer wrote:
>
> Strikes me as strange that open-coding skcipher_request_{alloc,free}
> is ideal, but dm-crypt is the only non-crypto consumer of
> MAX_CIPHER_BLOCKSIZE so really not worth standing up yet another
> interface wrapper.

It is pretty standard when you need to allocate data alongside the
request.  But yes if we could improve the helpers to handle this
that would be nice.

> Anyway, this code is certainly better for dm-crypt's needs.  I'm happy
> with you applying this change via your crypto tree.
> 
> Reviewed-by: Mike Snitzer <snitzer@kernel.org>

Thanks!
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

