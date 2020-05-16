Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 80FD81D6093
	for <lists+dm-devel@lfdr.de>; Sat, 16 May 2020 13:40:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589629211;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=8OPhuuFR4Xhn/hWZG3ycOY4AtonDcU6bJ9wTSP1vhw4=;
	b=PqukhfZkAn2Ajnydpx6q0SUm25l3QdMJAyVDB+Y5KxO38v4kImnTKSD3CLGTr9kN7/2/w5
	GNgMo+cPVcrMMI4iljSdI2tvhAfla5p1VaziM77WER1ioQe51Xmfc4lqFhXBJ6C4ww6o+f
	J8vGIQXxOzfzY4YhXxcwhAqN2nCEJ6E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-TzL1IOMfMkyypmjJ_RCgbQ-1; Sat, 16 May 2020 07:40:08 -0400
X-MC-Unique: TzL1IOMfMkyypmjJ_RCgbQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDB4B801503;
	Sat, 16 May 2020 11:40:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0313D5D9D3;
	Sat, 16 May 2020 11:39:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3455A1809543;
	Sat, 16 May 2020 11:39:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04GBdKCn003306 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 16 May 2020 07:39:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 362A51005E46; Sat, 16 May 2020 11:39:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 313D01006B01
	for <dm-devel@redhat.com>; Sat, 16 May 2020 11:39:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C15B0185A78B
	for <dm-devel@redhat.com>; Sat, 16 May 2020 11:39:17 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1589629157;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	content-type:content-type;
	bh=7nzjeA11iHruS820XTb1Yr4HhsdAtwCzcWD9bNKBytE=; 
	b=HygEXd7+TMqmaO8TCeBSF9VcJs9x4cYHXT7V8zP1bM3061Feksb+GKgxqBYHLhPI6FuTLx
	SVXpYcBaxpVjZIUCrWHTX0+CtrrctJ1PxyKqy9n5Nv27xScwE9O+9KhSvKxRdjamOPHySO
	niPBRdHtT+K+ETzIP2ukstfl5LVlsp7jsrV3VejSKLTWpdYcWMrjndXdZ/xhmIuTUEKuK2
	sCIPeMpubzSUOSCm8CX3sCMtdrnY0kq/4ocx30xPscttvUytjjesTs7FR/TRjfFQdllXDE
	KtdV/qlIbpxie7tRfDpHeaQNTUOVjzhZW1afZChHp0TonfWWBhRFwL03cL7CNA==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1589629157; a=rsa-sha256;
	cv=none;
	b=NYDqnTZ+mjH4HivatfZ1nZZE616DP4HD27hoql1E4IrPU0Uw06gFng36hy9DBRq0VEwE+5
	BPXSc/wPW/sx2qQZ6Y8GkgZD12/vWVrf9Nt53BZVRCku4XNoxmJnrxHhzvDwUDVLHsB+o6
	HxzFPWFcbgZ6aEO3/NO+D7nKd1mHoUmkKu4ZsXrx3vYbZIGYHcDG9OHpHZ+qBPJa1+X99h
	k3sCcdSksUhpfVd2vpHY2S7LRO8jfUMoka5hHq/lncOJ0tzj8e5/lS4DmbfBlu6RfwgEPY
	LYRMFhsW459L8lC0cgSRyAE3VNMS1MgBptRJUJJ4crtY7X2a9EuWiwjCelIG4A==
ARC-Authentication-Results: i=1; relay.mimecast.com; dkim=none;
	dmarc=pass (policy=none) header.from=vt.edu;
	spf=pass (relay.mimecast.com: domain of valdis@vt.edu designates
	198.82.183.121 as permitted sender) smtp.mailfrom=valdis@vt.edu
Received: from omr2.cc.vt.edu (outbound.smtp.vt.edu [198.82.183.121]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-188-4pJaQLjAOWy6Mfr_NkdFDg-1; Sat, 16 May 2020 07:39:15 -0400
X-MC-Unique: 4pJaQLjAOWy6Mfr_NkdFDg-1
Received: from mr6.cc.vt.edu (mr6.cc.ipv6.vt.edu
	[IPv6:2607:b400:92:8500:0:af:2d00:4488])
	by omr2.cc.vt.edu (8.14.4/8.14.4) with ESMTP id 04GBJL0P012052
	for <dm-devel@redhat.com>; Sat, 16 May 2020 07:19:21 -0400
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
	[209.85.160.199])
	by mr6.cc.vt.edu (8.14.7/8.14.7) with ESMTP id 04GBJFj9029294
	for <dm-devel@redhat.com>; Sat, 16 May 2020 07:19:21 -0400
Received: by mail-qt1-f199.google.com with SMTP id m9so5538997qtf.2
	for <dm-devel@redhat.com>; Sat, 16 May 2020 04:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:mime-version
	:content-transfer-encoding:date:message-id;
	bh=7nzjeA11iHruS820XTb1Yr4HhsdAtwCzcWD9bNKBytE=;
	b=l1cTpeXAiXt3vcAqmXbkXYdx5kiqx9HxCpr0zHauZubSG2+ou4ofYermAmnLrL+TCC
	MJf2TrUIMWgujhJ/E88s1DWknwhStZFDwB/D2JTqwQDFmQWFWTqXIfpbnFB1K2zahNRA
	M5Yxe2sg9rxi33eqtm/gE0YsdUYuQ3Gng4P/fNKhqViJonh3vSyyxbjQGZf25IVDT/kd
	WWniLKNt93jeBIKKSbnzSHhlY0F15K7C0APLOHjKdtOfvm+NbfN/+1URy1bBffGd4Z3B
	MBYfUoUmQD5rkl9KCMUhxRuNSn3ertMESSGXjf/AyndWC+bj6Najb4FkLu8ERWl7GGK4
	Fyag==
X-Gm-Message-State: AOAM532FWW0qQHsusbwVZFIsjZTQiukhGwgUzcGkR/qcPB0VFFtH7qNv
	fBSzPDwe1x49y4vKC8+CYjoUlbhx8rrOC/8Io+PO7PN2wRrDbsUqTKyqzOrz6/jY2DbPtvjXBtZ
	MK+wNJhhGCaAqIFI8b3V+kko=
X-Received: by 2002:ac8:361b:: with SMTP id m27mr7849363qtb.60.1589627955702; 
	Sat, 16 May 2020 04:19:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzu/VgBeAalVkQ2AoXUd1YZ5quJJpKb3lrAyS34gggihg4EW4vEhNzxDCfoUii8huxWiaMoqw==
X-Received: by 2002:ac8:361b:: with SMTP id m27mr7849338qtb.60.1589627955267; 
	Sat, 16 May 2020 04:19:15 -0700 (PDT)
Received: from turing-police ([2601:5c0:c001:c9e1::359])
	by smtp.gmail.com with ESMTPSA id
	g5sm3567148qkl.114.2020.05.16.04.19.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 16 May 2020 04:19:14 -0700 (PDT)
From: "Valdis =?utf-8?Q?Kl=c4=93tnieks?=" <valdis.kletnieks@vt.edu>
X-Google-Original-From: "Valdis =?utf-8?Q?Kl=c4=93tnieks?="
	<Valdis.Kletnieks@vt.edu>
To: Hannes Reinecke <hare@suse.de>, Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>
Mime-Version: 1.0
Date: Sat, 16 May 2020 07:19:13 -0400
Message-ID: <367320.1589627953@turing-police>
Authentication-Results: relay.mimecast.com; dkim=none;
	dmarc=pass (policy=none) header.from=vt.edu;
	spf=pass (relay.mimecast.com: domain of valdis@vt.edu designates
	198.82.183.121 as permitted sender) smtp.mailfrom=valdis@vt.edu
X-Mimecast-Spam-Score: 1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [dm-devel] next-20200514 - build issue in
	drivers/md/dm-zoned-target.c
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
Content-Type: multipart/mixed; boundary="===============0688044448998079060=="
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14

--===============0688044448998079060==
Content-Type: multipart/signed; boundary="==_Exmh_1589627953_23225P";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--==_Exmh_1589627953_23225P
Content-Type: text/plain; charset=us-ascii

Am seeing a build error in next-0514.  -0420 built OK.
building a 'make allmodconfig' on a RPi4 in 32-bit mode.

  MODPOST 7575 modules
ERROR: modpost: "__aeabi_uldivmod" [drivers/md/dm-zoned.ko] undefined!

objdump and 'make drivers/md/dm-zoned-target.s' tells
me that the problem is in function dmz_fixup_devices(), near here:

@ drivers/md/dm-zoned-target.c:806:             reg_dev->nr_zones = DIV_ROUND_UP(reg_dev->capacity,
        ldr     r0, [r6, #56]   @ reg_dev_166->capacity, reg_dev_166->capacity
        adds    r1, r3, r1      @ tmp316, _227, reg_dev_166->capacity
        adc     r0, r2, r0      @ tmp315, _227, reg_dev_166->capacity
        subs    r1, r1, #1      @, tmp316,
@ drivers/md/dm-zoned-target.c:805:             reg_dev->zone_nr_sectors = zoned_dev->zone_nr_sectors;
        strd    r2, [r6, #80]   @, reg_dev,
@ drivers/md/dm-zoned-target.c:806:             reg_dev->nr_zones = DIV_ROUND_UP(reg_dev->capacity,
        sbc     r0, r0, #0      @, tmp315,
        bl      __aeabi_uldivmod                @
@ drivers/md/dm-zoned-target.c:806:             reg_dev->nr_zones = DIV_ROUND_UP(reg_dev->capacity,
        str     r1, [r6, #64]   @ tmp306, reg_dev_166->nr_zones

git blame points at this commit:

commit 70978208ec91d798066f4c291bc98ff914bea222
Author: Hannes Reinecke <hare@suse.de>
Date:   Mon May 11 10:24:30 2020 +0200

    dm zoned: metadata version 2

Reverting that commit lets the build complete.



--==_Exmh_1589627953_23225P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.9.0 11/07/2018

iQIVAwUBXr/MMAdmEQWDXROgAQLTXQ/+OU15bnjwmP85lolwTjIv5S1rqgFkYmu/
57mmfcH6/P0JC/BvSfrQbaV7HdVx6xBYoywU4N24/huMaYLebX4gUd1ZVaF5QIVc
XYndVZmi5cJb91q1SfzkV6Z6pcYdscMiyv+ViMuHR81G/4vBq4/CVYzyxKaGJBK3
tj6mCALx/qvTN7EokTX+RQY3WHv75vKbS+RmgSwVNcQVuLT+PR6rJqYCIhKcpNIh
54vj3sXGkkzHmhoKRck0qQ/h0yXLugHQtqpufLcAkoWwIIqRkcDKoJMqq15dZ8S3
tA9wQ665Su47SbiUe6hjq7vJGcNAU0KsexfnRdKxGKElr8XYiHd2X2c5N9kCVh7i
cLljCXsewU0tByCTo2KvzT9m5iEqQepjHcYJWhrDtrl3PkOnoVKeUoJD0G53ayoN
mbyNxFm0IVY/+V6+FfuDuSVJ7lQK4jv6upibc+WUsA8LVi+sM+GeSCJx4Qx3Sfxd
iFKJWW6e7rlpTy+eQp3ipIzR2rXgasfCaXTJXzIDkQiQKmUpeRTiMttInpyyFmwL
mJRgcxq6HfXmREcy6yTRZf/IaTtxV2j3A6YZzoSFfg/pj52nX6dPbuaYPlhPDlaO
6tWHzUk5DqIdh8ydmeK3KUrsCdvNPt/ksUuMkEi/vFQPOyQ1qFYC+9sdDltY4bXL
AbbIXSkzR0A=
=LIvL
-----END PGP SIGNATURE-----

--==_Exmh_1589627953_23225P--


--===============0688044448998079060==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============0688044448998079060==--

