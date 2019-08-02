Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E704280294
	for <lists+dm-devel@lfdr.de>; Sat,  3 Aug 2019 00:10:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B761B19CF7A;
	Fri,  2 Aug 2019 22:10:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E7A260BF4;
	Fri,  2 Aug 2019 22:10:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C154C18089C8;
	Fri,  2 Aug 2019 22:10:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x72M3Sk8027154 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 2 Aug 2019 18:03:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 65C9E5C226; Fri,  2 Aug 2019 22:03:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA75E5C219;
	Fri,  2 Aug 2019 22:03:23 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 015433C93A;
	Fri,  2 Aug 2019 22:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1564783396; x=1596319396;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=aLXEo2buQ5DSLm1hIHtMEOFauYT1yYqm4H6NiGqbmUw=;
	b=BnKoJkr9PoJ7av2Ku3/jmPhBDzkNqmpeKZnTARLMggU0VLP5RfWxcAqA
	pMFNh+b75KngD3dPKjUKwoGM5yweigOcrRaD06eTOzqboaxG64blNKstE
	2ta29MQZE7EYWG7xYDGVfblNrSvxYqoBTZDewBZo3ZPCJEl8tQuHLECFX
	lTn8uePGVXAk5A3uEGk3xV795t3n3yodOpSKXAz8w2JxpEG6Bs5Hg/o93
	kUoz+Kiix9cEctGl2uQqkH9caHXAo8sXeBCHneKiTn96B5XJySxk5jkqS
	jZq//bVbPPw6RMzjfIqhZeLAIwQAY501hk7XXeiV98S6iufT6MJOwYTT9 w==;
IronPort-SDR: LrlqLgpdrIz9Xce2nnFvdTksr2mvnliduDFoppFA7Bs8uzXlIWvUN78uUNLu9XUsb68WKLlBu/
	nD1m2et9XXUsAlJtoiy+QS64XzL/V6Kku6ZSKKDXMVVN0noCiSlEI23ejFrT+qCQjimQ2N3mDQ
	fthZWSV/GUsgUc0PJLVg7haKfy6jvgwmtRp9UvgGdPRyJdJkLO78HrMVmuR27Fz6L0/Ns1zBTJ
	rcfkegShPlO41YvaFSL46HCXmJsL/4+ovuDhYAq+dDVpEPpSKdYkL7QVf5izQvySY2Y4xSwN6T
	T94=
X-IronPort-AV: E=Sophos;i="5.64,339,1559491200"; d="scan'208";a="116441578"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 03 Aug 2019 06:02:54 +0800
IronPort-SDR: ZMkzrmmcSlrx0fQtYItYvSQSozXZV78wQNGsHSqhJDJS4gxjThempjL71juZXaJIvuYXYpNehY
	drNSupiUI8yEbeRLkXvRk6+zHbZW+T8f84lO5synwE8gJVgBj8lxQ7pf4g4SSDgLPd2DXy9a2T
	VVmp67bSbi+HNV0dXSWqE2SzbD4b0Gsn/WgCXj0PSmITZ8Vqc1GajF1AuPbBj38V95vs5sG2yg
	eSHBRTBTxSQY7iQnWktH8sPvuW5ZDWxbPL0seHWSD+eFO6laaO4nMTvapkLNOUqssIT0wNo/TX
	ismZsYvh0KOTpO4wa3MY/drl
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	02 Aug 2019 15:00:50 -0700
IronPort-SDR: dlKPB7JwkIlDmo+N9WPDnUTTHktcRB9EP9Zll4F/yE8PsUe8kg4h/QXTwHhYXcFMlpSE+6AI9Y
	UEBVrIiYGtlg9Fe964YpJ3oNc1uNwBWIPJSitp+09eJwawzcjBgm8d3dQVrELO3woLGYxENMRq
	AUT34QCNqRFHb6Bvk9hh0ONJWdDHJq0mPcVhV+0DD7CDFYh4HOWXXdkFeU7+omJzcWeXi8TMZS
	2SauTmBReEZc4jEOiYmzC3upESkPBWW/sj8DBX48um5FH/duJjDCye4LEJ2GOF5wJRdfpCaNO1
	iDQ=
Received: from dhcp-10-88-173-43.hgst.com (HELO localhost.localdomain)
	([10.88.173.43])
	by uls-op-cesaip01.wdc.com with ESMTP; 02 Aug 2019 15:02:53 -0700
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Fri,  2 Aug 2019 15:02:49 -0700
Message-Id: <20190802220251.1217-1-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.39]); Fri, 02 Aug 2019 22:03:15 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Fri, 02 Aug 2019 22:03:15 +0000 (UTC) for IP:'216.71.154.45'
	DOMAIN:'esa6.hgst.iphmx.com' HELO:'esa6.hgst.iphmx.com'
	FROM:'dmitry.fomichev@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.154.45 esa6.hgst.iphmx.com 216.71.154.45
	esa6.hgst.iphmx.com <prvs=110ab3187=dmitry.fomichev@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>,
	Damien Le Moal <damien.lemoal@wdc.com>
Subject: [dm-devel] [PATCH 0/2] dm-zoned: add SPDX identifiers
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Fri, 02 Aug 2019 22:10:24 +0000 (UTC)

The first patch adds SPDX IDs to all dm-zoned source files.

The second patch fixes a few typos.

No functional change.

Dmitry Fomichev (2):
  dm-zoned: add SPDX license identifiers
  dm-zoned: fix a few typos

 drivers/md/dm-zoned-metadata.c | 9 +++++----
 drivers/md/dm-zoned-reclaim.c  | 3 ++-
 drivers/md/dm-zoned-target.c   | 1 +
 drivers/md/dm-zoned.h          | 1 +
 4 files changed, 9 insertions(+), 5 deletions(-)

-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
