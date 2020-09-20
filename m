Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7F89A27173E
	for <lists+dm-devel@lfdr.de>; Sun, 20 Sep 2020 20:56:47 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-4vJXCrD5PaGHXapTKFQ1Sg-1; Sun, 20 Sep 2020 14:56:44 -0400
X-MC-Unique: 4vJXCrD5PaGHXapTKFQ1Sg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B03A3802B5C;
	Sun, 20 Sep 2020 18:56:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4110760250;
	Sun, 20 Sep 2020 18:56:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8F20E1826D2B;
	Sun, 20 Sep 2020 18:56:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08KIu8Lq002077 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 20 Sep 2020 14:56:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C0B52110F0BD; Sun, 20 Sep 2020 18:56:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BACB7110F0BB
	for <dm-devel@redhat.com>; Sun, 20 Sep 2020 18:56:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62E4786C143
	for <dm-devel@redhat.com>; Sun, 20 Sep 2020 18:56:05 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-264-kMtLBEjON4ytxsv52C-WHg-1; Sun, 20 Sep 2020 14:56:00 -0400
X-MC-Unique: kMtLBEjON4ytxsv52C-WHg-1
Received: by mail-ej1-f65.google.com with SMTP id u21so14806727eja.2
	for <dm-devel@redhat.com>; Sun, 20 Sep 2020 11:56:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=ndUrGHBk92F1HUk+uxxSKtBUDi6Sd7JPiTr1APxGa3w=;
	b=G22YYXgXQr2KYEx4jar3+dSLdkvLx+INZfqm2KN51qEhj6XNUdAXHE1VRozH6+OvVW
	5nK0YIN2N7xzfdi7L3ozFEj9qjReICxTg29A+d8q/uj1ptByDppgwxbqWXc4d1cEX1NM
	nZPZMB7GGcjmhVaGGXQdRGzhel1aXFo/Ea7A+75JLh+DkYg7i7c/ND05fUHXQavqHfGa
	lmuBVuIFH6RKAByRS1vb0H7m1XQbV7UEUar5ZobiMKAqHsGeJFgmojnXkDe8U+XqXJ78
	EtWM31oZRycG83QrutIHFBjsSNm4hb5qS6hTPvXuznXAkWSRabyvKwhcVdH0tpiv4a+M
	kx4g==
X-Gm-Message-State: AOAM532E2bmZf7E5DazYExG31vgn2VC6ia8x82xAnv/aemrHrQ1t5ifF
	7fUvCBsjDtbEGj6B8zavFqXWefptdfJPtNbaqAbNHw==
X-Google-Smtp-Source: ABdhPJw5iohlXyCeLttrxkgBFQjc3U6GHH9QAJRXr6ebWx59BVm+Rbod9dk6PHIoy/8UAn87A2YkjANX8lc0r9162HY=
X-Received: by 2002:a17:906:8289:: with SMTP id
	h9mr46107743ejx.45.1600628159425; 
	Sun, 20 Sep 2020 11:55:59 -0700 (PDT)
MIME-Version: 1.0
From: Dan Williams <dan.j.williams@intel.com>
Date: Sun, 20 Sep 2020 11:55:48 -0700
Message-ID: <CAPcyv4h3oKM-2hoG=FWHJwzVqjptnpQV9C+W6txfp_qcBhd7yQ@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, Mike Snitzer <snitzer@redhat.com>,
	linux-nvdimm <linux-nvdimm@lists.01.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	Adrian Huang12 <ahuang12@lenovo.com>
Subject: [dm-devel] libnvdimm fixes 5.9-rc6
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

Hi Linus, please pull from:

  git://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm
tags/libnvdimm-fixes-5.9-rc6

...to receive a handful of fixes to address a string of mistakes in
the mechanism for device-mapper to determine if its component devices
are dax capable. You will notice that this branch was rebased this
morning and it has not appeared in -next. I decided to cut short the
soak time because the infinite-recursion regression is currently
crashing anyone attempting to test filesystem-dax in 5.9-rc5+. The
most recent rebase folded in a compile fix reported by the kbuild
robot for the uncommon CONFIG_DAX=m case. It should, "should",  be all
good now.

---

The following changes since commit 856deb866d16e29bd65952e0289066f6078af773:

  Linux 5.9-rc5 (2020-09-13 16:06:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm
tags/libnvdimm-fixes-5.9-rc6

for you to fetch changes up to d4c5da5049ac27c6ef8f6f98548c3a1ade352d25:

  dax: Fix stack overflow when mounting fsdax pmem device (2020-09-20
08:57:36 -0700)

----------------------------------------------------------------
libnvdimm fixes for 5.9-rc6

- Fix an original bug in device-mapper table reference counting when
  interrogating dax capability in the component device. This bug was
  hidden by the following bug.

- Fix device-mapper to use the proper helper (dax_supported() instead of
  the leaf helper generic_fsdax_supported()) to determine dax operation
  of a stacked block device configuration. The original implementation
  is only valid for one level of dax-capable block device stacking. This
  bug was discovered while fixing the below regression.

- Fix an infinite recursion regression introduced by broken attempts to
  quiet the generic_fsdax_supported() path and make it bail out before
  logging "dax capability not found" errors.

----------------------------------------------------------------
Adrian Huang (1):
      dax: Fix stack overflow when mounting fsdax pmem device

Dan Williams (1):
      dm/dax: Fix table reference counts

Jan Kara (1):
      dm: Call proper helper to determine dax support

 drivers/dax/super.c   | 16 ++++++++++------
 drivers/md/dm-table.c | 10 +++++++---
 drivers/md/dm.c       |  5 +++--
 include/linux/dax.h   | 22 ++++++++++++++++++++--
 4 files changed, 40 insertions(+), 13 deletions(-)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

