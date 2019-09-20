Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 79042BAFC6
	for <lists+dm-devel@lfdr.de>; Mon, 23 Sep 2019 10:39:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9718F8535C;
	Mon, 23 Sep 2019 08:39:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37A0B19D70;
	Mon, 23 Sep 2019 08:39:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1054A4EDA6;
	Mon, 23 Sep 2019 08:39:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8KFii6Z022032 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 20 Sep 2019 11:44:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E7CE01001B23; Fri, 20 Sep 2019 15:44:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx27.extmail.prod.ext.phx2.redhat.com
	[10.5.110.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA5AA1001B2D;
	Fri, 20 Sep 2019 15:44:39 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A2D18A26678;
	Fri, 20 Sep 2019 15:44:36 +0000 (UTC)
Received: from gandi.net (lmontsouris-657-1-214-187.w90-63.abo.wanadoo.fr
	[90.63.246.187])
	(Authenticated sender: thibaut.sautereau@clip-os.org)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 51A0A240008;
	Fri, 20 Sep 2019 15:44:34 +0000 (UTC)
Date: Fri, 20 Sep 2019 17:44:34 +0200
From: Thibaut Sautereau <thibaut.sautereau@clip-os.org>
To: dm-devel@redhat.com, Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>
Message-ID: <20190920154434.GA923@gandi.net>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.68]); Fri, 20 Sep 2019 15:44:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]);
	Fri, 20 Sep 2019 15:44:38 +0000 (UTC) for IP:'217.70.178.230'
	DOMAIN:'relay10.mail.gandi.net' HELO:'relay10.mail.gandi.net'
	FROM:'thibaut.sautereau@clip-os.org' RCPT:''
X-RedHat-Spam-Score: -0.7  (RCVD_IN_DNSWL_LOW, SPF_HELO_NONE,
	SPF_PASS) 217.70.178.230 relay10.mail.gandi.net
	217.70.178.230 relay10.mail.gandi.net
	<thibaut.sautereau@clip-os.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.68
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 23 Sep 2019 04:38:28 -0400
Cc: linux-kernel@vger.kernel.org
Subject: [dm-devel] dm-crypt error when CONFIG_CRYPTO_AUTHENC is disabled
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Mon, 23 Sep 2019 08:39:22 +0000 (UTC)

Hi,

I just got a dm-crypt "crypt: Error allocating crypto tfm" error when
trying to "cryptsetup open" a volume. I found out that it was only
happening when I disabled CONFIG_CRYPTO_AUTHENC.

drivers/md/dm-crypt.c includes the crypto/authenc.h header and seems to
use some CRYPTO_AUTHENC-related stuff. Therefore, shouldn't
CONFIG_DM_CRYPT select CONFIG_CRYPTO_AUTHENC?

-- 
Thibaut Sautereau
CLIP OS developer

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
