Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7CB61FF6E
	for <lists+dm-devel@lfdr.de>; Mon,  7 Nov 2022 21:18:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667852306;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1Vz0ORUrql5x5ic1yjPVHIUfplxy/Hbnw3xFNG1byLQ=;
	b=Da9u4H6bSFOAiMhXgDO5RqPSnUbJdzJa1Hh2huI4rGjhJtMWhuwuXf28tub/9RUEsO2t0Z
	sz2281+GJmSOzINuOnFdVDBisW9DqBCRF4MX+KEpxHPgRoxavrKQpeRnZppFG0zqkEgRP7
	Mm/A4ejfGt0w+xSyomq/2fAlEXZ2sZo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-cjzwISSSNgGLYTQtK1-Yyw-1; Mon, 07 Nov 2022 15:18:24 -0500
X-MC-Unique: cjzwISSSNgGLYTQtK1-Yyw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DBD953C01C10;
	Mon,  7 Nov 2022 20:18:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EBC23140EBF5;
	Mon,  7 Nov 2022 20:18:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 70E431946597;
	Mon,  7 Nov 2022 20:18:13 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E157B1946587
 for <dm-devel@listman.corp.redhat.com>; Mon,  7 Nov 2022 20:18:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C54A340C2064; Mon,  7 Nov 2022 20:18:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD99740C2065
 for <dm-devel@redhat.com>; Mon,  7 Nov 2022 20:18:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6F39811E67
 for <dm-devel@redhat.com>; Mon,  7 Nov 2022 20:18:12 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-_TXhQqN7M46caf9CClQgRw-1; Mon, 07 Nov 2022 15:18:10 -0500
X-MC-Unique: _TXhQqN7M46caf9CClQgRw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 34F8261182;
 Mon,  7 Nov 2022 20:18:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59D1CC433C1;
 Mon,  7 Nov 2022 20:18:09 +0000 (UTC)
Date: Mon, 7 Nov 2022 12:18:07 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <Y2ln/953uv8Zg1jC@sol.localdomain>
References: <20221107144229.1547370-1-hch@lst.de>
 <20221107144229.1547370-3-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20221107144229.1547370-3-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [dm-devel] [PATCH 2/3] blk-crypto: add a
 blk_crypto_config_supported_natively helper
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
Cc: Jens Axboe <axboe@kernel.dk>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 Mike Snitzer <snitzer@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-block@vger.kernel.org, dm-devel@redhat.com,
 Jaegeuk Kim <jaegeuk@kernel.org>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 07, 2022 at 03:42:28PM +0100, Christoph Hellwig wrote:
> Add a blk_crypto_cfg_supported helper that wraps

s/blk_crypto_cfg_supported/blk_crypto_config_supported_natively/

> __blk_crypto_cfg_supported to retreive the crypto_profile from the

s/retreive/retrieve/.  checkpatch warns about this.

Otherwise this patch look good, thanks!

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

