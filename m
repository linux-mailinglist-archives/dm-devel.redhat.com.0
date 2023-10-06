Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FC67BB052
	for <lists+dm-devel@lfdr.de>; Fri,  6 Oct 2023 04:33:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696559609;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EBe14rjRQG7bOfqttMznQQ7u1XQ8soWvYE1OQqoNeEU=;
	b=INOfsKSYUlqkEjy5IQ1/XDCsPtD4F8bMhWlhFORSHAbc5XdWBhSMP8a0ZvR6265NaaX0zf
	nKfUXowaQKPBiF6Es+pLQH5vP72tYTgG9r1wYN/+AVlCdjuEofq7cbg7hl663bJpVa8Tn4
	E4BnhkG0xbPujRi1Kfo2xLqt0JeqK5k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-319-KpgLe8mtPlm0AmO-P87XIw-1; Thu, 05 Oct 2023 22:33:27 -0400
X-MC-Unique: KpgLe8mtPlm0AmO-P87XIw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBEAC101A590;
	Fri,  6 Oct 2023 02:33:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E61E140E953;
	Fri,  6 Oct 2023 02:33:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EDF9C19465B8;
	Fri,  6 Oct 2023 02:33:21 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 51E6F194658F
 for <dm-devel@listman.corp.redhat.com>; Fri,  6 Oct 2023 02:33:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2AD66140E953; Fri,  6 Oct 2023 02:33:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from abb.hmeau.com (unknown [10.67.24.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D61F4140E962;
 Fri,  6 Oct 2023 02:33:20 +0000 (UTC)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
 by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1qoaeL-0044GQ-OJ; Fri, 06 Oct 2023 10:33:10 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 06 Oct 2023 10:33:14 +0800
Date: Fri, 6 Oct 2023 10:33:14 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Mike Snitzer <snitzer@kernel.org>
Message-ID: <ZR9x6ifhd6axh5Ki@gondor.apana.org.au>
References: <f1b8d8f5-2079-537e-9d0f-d58da166fe50@gmail.com>
 <ZR9dEiXhQv-wBVA2@debian.me> <ZR9l446ndB4n1Xl4@gondor.apana.org.au>
 <ZR9wRq7Rkz+LocDX@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ZR9wRq7Rkz+LocDX@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [dm-devel] dm crypt: Fix reqsize in crypt_iv_eboiv_gen
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
Cc: Linux Regressions <regressions@lists.linux.dev>,
 Tatu =?iso-8859-1?Q?Heikkil=E4?= <tatu.heikkila@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Device Mapper <dm-devel@redhat.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Alasdair Kergon <agk@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gondor.apana.org.au
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 05, 2023 at 10:26:14PM -0400, Mike Snitzer wrote:
>
> Sure, please do.  Shouldn't your header Cc: stable given that the
> Fixes commit implies v6.5 needs this fix?

Sure I'll add it although it will be picked up automatically due
to the Fixes header.  I'll also fix the reporter's name.

> Reviewed-by: Mike Mike Snitzer <snitzer@kernel.org>

Thanks!
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

