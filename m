Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 915104AD5F
	for <lists+dm-devel@lfdr.de>; Tue, 18 Jun 2019 23:30:18 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C4E5230872ED;
	Tue, 18 Jun 2019 21:30:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 83D32BA4E;
	Tue, 18 Jun 2019 21:30:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 824048E1F;
	Tue, 18 Jun 2019 21:29:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5ILSQTP018883 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 18 Jun 2019 17:28:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 48DD7608C2; Tue, 18 Jun 2019 21:28:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 427A560922
	for <dm-devel@redhat.com>; Tue, 18 Jun 2019 21:28:21 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B9E6A3086204
	for <dm-devel@redhat.com>; Tue, 18 Jun 2019 21:28:05 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id f9so1004926wre.12
	for <dm-devel@redhat.com>; Tue, 18 Jun 2019 14:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=NgQVif3SJzNXiAZCno1M2C2zTfT84Y/U1CUnXY4DVsM=;
	b=zoKcuhnPc6YVnlS3X3fUJX74xIyUsF/Wc3w19VeACAsSP3fFi6sXxOrYahrn4KHoWb
	M4wXn/yuqgZOr4/oxr98AUkEp3V/OlQnzQxj/5NCSiPikL2n62i6k0JH1clAtRtEdhWh
	D2B3Yb/hvBB3wnXKMPBfraXnKPX1XSOdGLz/Vyl3ApnwHXU4nzTqNnzL98gOCJPuuASf
	brEC8unTqTLjtqnIxDWeuOXc+NZRrrKybJRa7I9oTfyQyJ5JhGzpgl3LDyB8d+L8GKo7
	TScSIfSdX1U/dOcgU6Rsny5veX3bsVYUtWP73SPGPTXURai1Pi0D3mhbBlCl7xib8QDd
	j/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NgQVif3SJzNXiAZCno1M2C2zTfT84Y/U1CUnXY4DVsM=;
	b=ZcdVMiEsaeyrhL4MQiKzRVAVbWtkRgMZwc3Do4ZC00/KUftIlZY3W5sXeeNWz+5M3m
	+LFO5e1WHsoEet+O5HfXCb+ELu2bls7j5iPLjwk9ddtzNt7cLBvGTNNHxunJdofoj+7O
	ouyoO83X4qHAAcGMoOrc8xApJkB8atQ37d1g0qaH5sRvPmeHRb7PKyYQhX3Yb0xxczp+
	sVa+1JdBzeIKWHI1RYC6CNFiK/qTET4R0xRk57FXZepBz74L19uK300ApgSTvmIHqYSS
	HrAH3igJmEQqnPWDxQjLn8e8V+hEHixTGXwD4xD8dneJb2niCYbQECKcn/oh2QvXhpim
	FQUQ==
X-Gm-Message-State: APjAAAXHpvZuR3GjnEVN0MCr9ScAo/cIdeTEFtGV/mA+R57fdPZDd2qX
	Rj8l9ogPb5geO0JnRvjX8iBEzHRVYnt8kD19
X-Google-Smtp-Source: APXvYqxCmwvTG3xENPWFv7zECq2kphLnb2KN6MXafy6Nrte3k30uDJ2JFjEDHUMHHdlkW7sQi76feA==
X-Received: by 2002:adf:f442:: with SMTP id f2mr16345724wrp.275.1560893284262; 
	Tue, 18 Jun 2019 14:28:04 -0700 (PDT)
Received: from e111045-lin.arm.com (lfbn-nic-1-216-10.w2-15.abo.wanadoo.fr.
	[2.15.62.10]) by smtp.gmail.com with ESMTPSA id
	h21sm2273831wmb.47.2019.06.18.14.28.03
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 18 Jun 2019 14:28:03 -0700 (PDT)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: linux-crypto@vger.kernel.org
Date: Tue, 18 Jun 2019 23:27:45 +0200
Message-Id: <20190618212749.8995-1-ard.biesheuvel@linaro.org>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Tue, 18 Jun 2019 21:28:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Tue, 18 Jun 2019 21:28:05 +0000 (UTC) for IP:'209.85.221.65'
	DOMAIN:'mail-wr1-f65.google.com' HELO:'mail-wr1-f65.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.108  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_NONE) 209.85.221.65 mail-wr1-f65.google.com 209.85.221.65
	mail-wr1-f65.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	Milan Broz <gmazyland@gmail.com>
Subject: [dm-devel] [PATCH v2 0/4] crypto: switch to crypto API for ESSIV
	generation
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Tue, 18 Jun 2019 21:30:17 +0000 (UTC)

This series creates an ESSIV template that produces a skcipher or AEAD
transform based on a tuple of the form '<skcipher>,<cipher>,<shash>'
(or '<aead>,<cipher>,<shash>' for the AEAD case). It exposes the
encapsulated sync or async skcipher/aead by passing through all operations,
while using the cipher/shash pair to transform the input IV into an ESSIV
output IV.

This matches what both users of ESSIV in the kernel do, and so it is proposed
as a replacement for those, in patches #2 and #4.

This code has been tested using the fscrypt test suggested by Eric
(generic/549), as well as the mode-test script suggested by Milan for
the dm-crypt case. I also tested the aead case in a virtual machine,
but it definitely needs some wider testing from the dm-crypt experts.

Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Eric Biggers <ebiggers@google.com>
Cc: dm-devel@redhat.com
Cc: linux-fscrypt@vger.kernel.org
Cc: Gilad Ben-Yossef <gilad@benyossef.com>
Cc: Milan Broz <gmazyland@gmail.com>

Ard Biesheuvel (4):
  crypto: essiv - create wrapper template for ESSIV generation
  fs: crypto: invoke crypto API for ESSIV handling
  md: dm-crypt: infer ESSIV block cipher from cipher string directly
  md: dm-crypt: switch to ESSIV crypto API template

 crypto/Kconfig              |   4 +
 crypto/Makefile             |   1 +
 crypto/essiv.c              | 624 ++++++++++++++++++++
 drivers/md/Kconfig          |   1 +
 drivers/md/dm-crypt.c       | 237 ++------
 fs/crypto/Kconfig           |   1 +
 fs/crypto/crypto.c          |   5 -
 fs/crypto/fscrypt_private.h |   9 -
 fs/crypto/keyinfo.c         |  88 +--
 9 files changed, 675 insertions(+), 295 deletions(-)
 create mode 100644 crypto/essiv.c

-- 
2.17.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
