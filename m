Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1D768300743
	for <lists+dm-devel@lfdr.de>; Fri, 22 Jan 2021 16:30:15 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-zPIt2hiAO8qCVpe4mju5IQ-1; Fri, 22 Jan 2021 10:30:11 -0500
X-MC-Unique: zPIt2hiAO8qCVpe4mju5IQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6F8B801817;
	Fri, 22 Jan 2021 15:30:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 194745C237;
	Fri, 22 Jan 2021 15:30:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A84A64E58E;
	Fri, 22 Jan 2021 15:30:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10MFQ5MJ028573 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 22 Jan 2021 10:26:06 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AECDB10EB2A9; Fri, 22 Jan 2021 15:26:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AAC4210EB2A0
	for <dm-devel@redhat.com>; Fri, 22 Jan 2021 15:26:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 444AA82DFE0
	for <dm-devel@redhat.com>; Fri, 22 Jan 2021 15:26:03 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-172-TIR3Ehg8NPC7mamxEPaK1g-1; Fri, 22 Jan 2021 10:26:01 -0500
X-MC-Unique: TIR3Ehg8NPC7mamxEPaK1g-1
Received: by mail-wm1-f42.google.com with SMTP id y187so4673488wmd.3
	for <dm-devel@redhat.com>; Fri, 22 Jan 2021 07:26:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TDSXVKSqCZu1eW5+oZwCSi3rshW8BWQgYDZe5PajAxM=;
	b=Fe/fNjJiHIPkSVkC7Wat8fNHdWQJEw48djicR68rAq/lOqiw0pQtWFOTrps+IEA8H5
	7IzD+muB6nQKs3UFBg4D7HLg5eGFojuQHFHzzDyzeGRvdDF4SyWUCJyOp7tRdAoZWrCR
	sDQXOxtR2G4VLyWDcjXQLcEzB9rKJ+zxt2WS2jbSDgJpPOyiTnsFEj3UxqX0MOIge4Ph
	uDh0hMh852i2xCsbPDfwdhZRFIwbAofkxlGg/bzXrILoVs9GVrtNnep7P8kO+HcpooX+
	hoWJEgT44WSlC+XdaL0coWgjdfLOlYpZpE1DNEnfVzvpE+8Bzh5piJ72/L2s/SPC0/dK
	tYqw==
X-Gm-Message-State: AOAM530bnYKNhzaO8kU2ulap7n3V7nwNkNXQCFgq0kW04ZSprLMeyc9b
	VMvSe6SoK0d6OKxDgSAzTeUm2w==
X-Google-Smtp-Source: ABdhPJyY14vLXWiRDW01SszZ4j3wv8uSMzrTFHkm2ArQL/y30W1EI2s2dJfTHm5mUDS3FszheySwCA==
X-Received: by 2002:a05:600c:214c:: with SMTP id
	v12mr4465980wml.8.1611329159152; 
	Fri, 22 Jan 2021 07:25:59 -0800 (PST)
Received: from snf-864.vm.snf.arr ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	r1sm12685159wrl.95.2021.01.22.07.25.57
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jan 2021 07:25:58 -0800 (PST)
From: Nikos Tsironis <ntsironis@arrikto.com>
To: snitzer@redhat.com, agk@redhat.com, dm-devel@redhat.com
Date: Fri, 22 Jan 2021 17:25:52 +0200
Message-Id: <20210122152556.24822-1-ntsironis@arrikto.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: ejt@redhat.com, ntsironis@arrikto.com
Subject: [dm-devel] [PATCH 0/4] dm era: Various minor fixes
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

While working on fixing the bugs that cause lost writes, for which I
have sent separate emails, I bumped into several other minor issues that
I fix in this patch set.

In particular, this series of commits introduces the following fixes:

1. Add explicit check that the data block size hasn't changed
2. Fix bitset memory leaks. The in-core bitmaps were never freed.
3. Fix the writeset tree equality test function to use the right value
   size.
4. Remove unreachable resize operation in pre-resume function.

More information about the fixes can be found in their commit messages.

Nikos Tsironis (4):
  dm era: Verify the data block size hasn't changed
  dm era: Fix bitset memory leaks
  dm era: Use correct value size in equality function of writeset tree
  dm era: Remove unreachable resize operation in pre-resume function

 drivers/md/dm-era-target.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

-- 
2.11.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

