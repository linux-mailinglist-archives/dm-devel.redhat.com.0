Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E0082D5C
	for <lists+dm-devel@lfdr.de>; Tue,  6 Aug 2019 10:03:31 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 76B2CEC555;
	Tue,  6 Aug 2019 08:03:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE84A600CC;
	Tue,  6 Aug 2019 08:03:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6D5A31800204;
	Tue,  6 Aug 2019 08:03:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7682nTN018924 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 6 Aug 2019 04:02:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1F21E4116; Tue,  6 Aug 2019 08:02:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 18126F6E0
	for <dm-devel@redhat.com>; Tue,  6 Aug 2019 08:02:43 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DE12F3082D6C
	for <dm-devel@redhat.com>; Tue,  6 Aug 2019 08:02:42 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n9so61808043wrr.4
	for <dm-devel@redhat.com>; Tue, 06 Aug 2019 01:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=LPxrPr3q5T9XtnaxYFQ5MHNB86Gds1XCyjunFknCBCg=;
	b=RlE497f7kLUSLf4mV597Si4ml7zHS2egprS8akgckGS4RA1YP4GqcmZHvmPQk4Tgm5
	2/pKmkGJlCek74lO5Rd9WHtWeMvI1M7DQtLGH9T+avk/4v4wf6qMZmwcG0FDyFnbFx38
	VzDWvZoYnNYcbKmTfDWOA9b3Oh1/uwmQ3O7Yz6n02JvPj04C/PFG1TULau4EJwIPzUTx
	dJE/FiJqvcV2nwup9SZYXA45CIuLbnp9YMVhTErIKmk5udQ90LKxRf3WBwKTLtS0qrjH
	4pqwrkEgAyPtkuC2OR99Vt+MfTYQpgdwcWoz0a12nxUBU9JN1SCpZfBZl93fOtZoGI9s
	Oq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LPxrPr3q5T9XtnaxYFQ5MHNB86Gds1XCyjunFknCBCg=;
	b=R6YdJIDgIRfuWUi0dbKb37VOXxAw8fxhi+Q14R0vAKd9GuaKhaguLN8uZ3EK5GbEpV
	hE/qe9bSkBPLHaS/9nxP8RW2tjXLc1iCM+b9ZVgXZprddTJMOqGFReqqwTXLYjhS8drI
	jRLEfFFvGVhac4eBZNT+oHXoXNFzhYGt4TtYqGafBZheiuG2VJO+k7tAHmVXgPYSoVsq
	oc1URz2R6P2qh7zI29Xn8mzhZl5y9Cisc6/CHrhRn19289jr2Cl60GdXyO8NfY+rQd1B
	YGrfb9r2bQdCSjaceA+5XO4caqAEDJb5sTNqbLJjNvDlaBeQUFM+jzMSrf8tqKNtRpgS
	eZsw==
X-Gm-Message-State: APjAAAUuvDxEoG1i+uOuM+4uZO9TeB7bYX7MT6OxdamnuOQQ4HOyHnT0
	SPS/JZfCl84c2LJq4lxJ2JSbRw==
X-Google-Smtp-Source: APXvYqzSjUHqVv3p94bbd0GUC+Orah/QZCx7GT1jK2qKN7lBk5fYqPKu7RuMoW3+YbpduUpR/VMPnw==
X-Received: by 2002:adf:de10:: with SMTP id b16mr2946471wrm.296.1565078561540; 
	Tue, 06 Aug 2019 01:02:41 -0700 (PDT)
Received: from localhost.localdomain ([2a02:587:a407:da00:582f:8334:9cd9:7241])
	by smtp.gmail.com with ESMTPSA id
	g12sm123785475wrv.9.2019.08.06.01.02.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Aug 2019 01:02:40 -0700 (PDT)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: linux-crypto@vger.kernel.org
Date: Tue,  6 Aug 2019 11:02:32 +0300
Message-Id: <20190806080234.27998-1-ard.biesheuvel@linaro.org>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Tue, 06 Aug 2019 08:02:43 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Tue, 06 Aug 2019 08:02:43 +0000 (UTC) for IP:'209.85.221.67'
	DOMAIN:'mail-wr1-f67.google.com' HELO:'mail-wr1-f67.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.101  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.67 mail-wr1-f67.google.com 209.85.221.67
	mail-wr1-f67.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: herbert@gondor.apana.org.au, snitzer@redhat.com,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, ebiggers@kernel.org,
	dm-devel@redhat.com, gmazyland@gmail.com, agk@redhat.com
Subject: [dm-devel] [RFC PATCH 0/2] dm-crypt: get rid of cipher API for EBOIV
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Tue, 06 Aug 2019 08:03:30 +0000 (UTC)

This is a follow-up to the discussion [0] started by regarding adding
new uses of the cipher API to dm-crypt. In particular, the discussion
was about EBOIV, which is used by BitLocker to generate IVs from byte
offsets, to be used for AES encryption in CBC mode.

The way EBOIV support is currently integrated does not restrict it at
all, which means we may paint ourselves into a corner where we are
forced to support unexpected and novel ways users have decided to
wire up EBOIV. This may become a maintenance burden going forward,
and given that EBOIV uses the same key for generating the IV via
AES encryption as the one used for the data, it may produce configurations
that are not entirely safe.

So let's restrict EBOIV to cbc(aes) (patch #1), to prevent it from
being used in arbitrary cipher cocktails, and avoid ending up with
a disproportionate maintenance burden on the crypto API side.

Patch #2 switches the IV generation to the AES library, which avoids
potential key leaks due to the use of aes-generic as the cipher used
for IV generation.

[0] https://www.redhat.com/archives/dm-devel/2019-July/msg00041.html

Ard Biesheuvel (2):
  md/dm-crypt - restrict EBOIV to cbc(aes)
  md/dm-crypt - switch to AES library for EBOIV

 drivers/md/dm-crypt.c | 34 ++++++++------------
 1 file changed, 13 insertions(+), 21 deletions(-)

-- 
2.17.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
