Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A32561F765
	for <lists+dm-devel@lfdr.de>; Mon,  7 Nov 2022 16:18:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667834294;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7nw5kWSq+DBBynh1uEkivl/WPSnyZ4rY56Kf0wJPLGQ=;
	b=JoS2rd8PDTcV2zzpuPy9fcbsh/g8i5cwT2N5SVLwSMQsK/x2N5Olaam8GkzVZVrZGmADa9
	k75jKyOUSwwqG4csUJo2Fxrb5khfz79XXVTEpFV22S44FGKb2Bfa7T5QYaU5ucDMpOUALZ
	N9/EbuCsr6WDYb0cDqdU5qmQxtn4oEc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-210-JX6kUEQYMNCRBtANsLiLEg-1; Mon, 07 Nov 2022 10:18:11 -0500
X-MC-Unique: JX6kUEQYMNCRBtANsLiLEg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61DDD18E0BD3;
	Mon,  7 Nov 2022 15:18:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B347F1121314;
	Mon,  7 Nov 2022 15:18:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9187219465B5;
	Mon,  7 Nov 2022 15:18:02 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BBAE61946588
 for <dm-devel@listman.corp.redhat.com>; Mon,  7 Nov 2022 15:17:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 48D6342222; Mon,  7 Nov 2022 15:17:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4178B35429
 for <dm-devel@redhat.com>; Mon,  7 Nov 2022 15:17:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22417185A78F
 for <dm-devel@redhat.com>; Mon,  7 Nov 2022 15:17:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-358-TKwQoPXeMyyu3h9SR9Gr9Q-1; Mon, 07 Nov 2022 10:17:20 -0500
X-MC-Unique: TKwQoPXeMyyu3h9SR9Gr9Q-1
Received: from [2001:4bb8:191:2450:bd6a:c86c:b287:8b99] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1os3KZ-00FJWE-PF; Mon, 07 Nov 2022 14:42:32 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon,  7 Nov 2022 15:42:26 +0100
Message-Id: <20221107144229.1547370-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [dm-devel] pass a struct block_device to the blk-crypto interfaces
 v2
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
Cc: linux-block@vger.kernel.org, "Theodore Y. Ts'o" <tytso@mit.edu>,
 Mike Snitzer <snitzer@kernel.org>, linux-fscrypt@vger.kernel.org,
 Eric Biggers <ebiggers@kernel.org>, dm-devel@redhat.com,
 Jaegeuk Kim <jaegeuk@kernel.org>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

this series switches the blk-crypto interfaces to take block_device
arguments instead of request_queues, and with that finishes off the
project to hide struct request_queue from file systems.

Changes since v1:
 - keep using request_queue in the Documentation for driver interfaces
 - rename to blk_crypto_cfg_supported to
   blk_crypto_config_supported_natively and move it to blk-crypto.[ch]
 - mark __blk_crypto_cfg_supported private

Diffstat:
 Documentation/block/inline-encryption.rst |   12 +++++-----
 block/blk-crypto-internal.h               |    3 ++
 block/blk-crypto.c                        |   33 ++++++++++++++++++------------
 drivers/md/dm-table.c                     |    2 -
 fs/crypto/inline_crypt.c                  |   14 ++++--------
 include/linux/blk-crypto-profile.h        |    3 --
 include/linux/blk-crypto.h                |   10 +++++----
 7 files changed, 41 insertions(+), 36 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

