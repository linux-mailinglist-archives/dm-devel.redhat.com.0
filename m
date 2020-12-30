Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3851A2E7CCF
	for <lists+dm-devel@lfdr.de>; Wed, 30 Dec 2020 22:47:07 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-gPq11m5GNwyiIJbPp43vHw-1; Wed, 30 Dec 2020 16:46:40 -0500
X-MC-Unique: gPq11m5GNwyiIJbPp43vHw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DE12107ACE4;
	Wed, 30 Dec 2020 21:46:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23A7C60C17;
	Wed, 30 Dec 2020 21:46:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EEA7F180954D;
	Wed, 30 Dec 2020 21:46:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BULk48S016201 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 30 Dec 2020 16:46:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D33FF2026DE4; Wed, 30 Dec 2020 21:46:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE5D42026D76
	for <dm-devel@redhat.com>; Wed, 30 Dec 2020 21:46:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3409D811E78
	for <dm-devel@redhat.com>; Wed, 30 Dec 2020 21:46:00 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-289-E8bqBEOMNIexlYyLeJbZsw-1; Wed, 30 Dec 2020 16:45:56 -0500
X-MC-Unique: E8bqBEOMNIexlYyLeJbZsw-1
Received: by mail-wm1-f50.google.com with SMTP id y23so5895564wmi.1
	for <dm-devel@redhat.com>; Wed, 30 Dec 2020 13:45:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/kbVtG9+aGsr44Zrtbqkbn+LIP6L6fp4kSH2R8701XE=;
	b=C8r3KtkO3gIFNTx0NClMLQR9opol9rjjbMnbhqFyevHCfd82paCNHBg+tBvmN780Wu
	R8Z/Y7ESTD2zlw85Xsza6Mdi4w/sfZhl/xvTu24sn76VU7aJ9REz1RsIjNZ+PgcjTz8R
	+gMYA1wiHCJf7lGsm59Dv04eG7DcprjTgJC5raM3jRBr72e/9sRa6Sn2MssLQXF1gYj9
	VRa4D+L24xzfKTs42f2RYWxfy93HXWb+hdCnjjlu4KFOLDsFlSG1B4LjHU3jidi0xI/Q
	E4OwZqMhU4CzunFxp6mx15X+PPCs09RVlFyaDQAm/1v10VSNJw3NpQbq7xU1Bw0IEPBr
	n8VQ==
X-Gm-Message-State: AOAM532qaeU2Mu/VnNXDcjgF86mMv1/0Nhu1TWp5LfmTlSRVsh+DbQ8d
	si8SHt9bvilxZl1ornGqmFcBJg==
X-Google-Smtp-Source: ABdhPJwmWH9sv8kVx66i/Zig3WzfuPqiSDd5ysSSfSorYVgQ2t4wrzU0rEZtrhkOUVb/l94N+FDjPw==
X-Received: by 2002:a7b:cb09:: with SMTP id u9mr9373821wmj.61.1609364754774;
	Wed, 30 Dec 2020 13:45:54 -0800 (PST)
Received: from dev.cfops.net (165.176.200.146.dyn.plus.net. [146.200.176.165])
	by smtp.gmail.com with ESMTPSA id
	r7sm8749894wmh.2.2020.12.30.13.45.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 30 Dec 2020 13:45:53 -0800 (PST)
From: Ignat Korchagin <ignat@cloudflare.com>
To: agk@redhat.com, snitzer@redhat.com, dm-devel@redhat.com, dm-crypt@saout.de,
	linux-kernel@vger.kernel.org
Date: Wed, 30 Dec 2020 21:45:18 +0000
Message-Id: <20201230214520.154793-1-ignat@cloudflare.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Damien.LeMoal@wdc.com, herbert@gondor.apana.org.au,
	kernel-team@cloudflare.com, nobuto.murata@canonical.com,
	josef@toxicpanda.com, ebiggers@kernel.org, clm@fb.com,
	mpatocka@redhat.com, Ignat Korchagin <ignat@cloudflare.com>,
	dsterba@suse.com, mail@maciej.szmigiero.name, linux-btrfs@vger.kernel.org
Subject: [dm-devel] [PATCH v2 0/2] dm crypt: some fixes to support dm-crypt
	running in softirq context
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Changes from v1:
0001: Handle memory allocation failure for GFP_ATOMIC

Ignat Korchagin (2):
  dm crypt: use GFP_ATOMIC when allocating crypto requests from softirq
  dm crypt: do not wait for backlogged crypto request completion in
    softirq

 drivers/md/dm-crypt.c | 135 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 120 insertions(+), 15 deletions(-)

-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

