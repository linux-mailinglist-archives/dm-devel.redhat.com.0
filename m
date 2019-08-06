Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BC382914
	for <lists+dm-devel@lfdr.de>; Tue,  6 Aug 2019 03:12:31 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B6355C08E29B;
	Tue,  6 Aug 2019 01:12:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 49B005D784;
	Tue,  6 Aug 2019 01:12:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E11C118089C8;
	Tue,  6 Aug 2019 01:12:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x76172Lc011237 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 5 Aug 2019 21:07:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 159FE1001959; Tue,  6 Aug 2019 01:07:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FE6910016E8;
	Tue,  6 Aug 2019 01:06:57 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B28FD30BCB9C;
	Tue,  6 Aug 2019 01:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1565053610; x=1596589610;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=y1p3AHRfkxlFeo3StJgee+CToA9p/YI8+yqgChwh3m0=;
	b=HzV/6voOZBZJKl5gYOCZ0GvfyJTQVzp+BnHXAvHt0wvrdLth9NEWQQZ+
	f6aC78Gw4IMAR4A0GPu6os1NmpEUgZA+Z7UMng+RmVv0YBuFiCA1cThT+
	6GKV/cjrgtV3EdAjqTQSyPYJSV/CHZyWq808blKNx+NfuYmy8tYwwPF+S
	0y+qAqwdQ9ZsDScUi5/+0s7hMyh/xcjCKdPexhFU1OJcj99QFu0YUxG4R
	Hs3KXoJF+rDJVQ3cVgatr+bX+BRN0qXfKsHlDKa7C4Fol97ws33CByr74
	JXPjp9oEAgNJAHU2irh7bXz/UXzZMl9YOchpL0jMs+k1/eqLg6YSoBVNC Q==;
IronPort-SDR: yOaVobNlH1JJdAb1aoprGiWjo6EO41RkW3NeslzfiLSm2lT9PtcIkMSYbJ2dW4/X4t0zPKc0hb
	ahBWHMCb+XxJctmUpqYm+VgjcrLh+Ovq2sqONSwOwlwRdFJRn44fNEGyrhQ7OaDEqfjeGGvIxa
	fgqaYKdHUoPmo5OVJNtX0lBbVCoqOX9h2feXySd8ksFf0sazGz3AK0sYn4633mUnNQyOPVVV1B
	QBT0UfNaWOwtpqaVnJQUBW0j24mCUWUhwhSsgSP7mn2KCGG2ircUoCdo+idTL86e2uJm8eqDl6
	5k4=
X-IronPort-AV: E=Sophos;i="5.64,350,1559491200"; d="scan'208";a="119702620"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 06 Aug 2019 09:06:28 +0800
IronPort-SDR: qi804q86Y07h4uXh/0PpwCF5x8gmHh2pdZyL4sTrvI6NTBenKJVxXAuxbWY/koNJ5f5qc3oiyT
	qHUO5WwLGl6xqKKISECcTgCVWWGKt6vVtHS7cYlpa+58i45ELts1FQFa5UvitcA0OPtOBMhK1U
	GJVD5qxClVfvqP//k7892WpwUZa+57Nr6thATClbT/0mkfsDnCMhjI5o1cuC2HdjZQiwcryHOT
	Bq/UYS6trZiU0qo1enxKTrTP5gQhfYODuqHRr16tIMDQUNzTUjehKfvko+M+kPiNIOLpaF9b/p
	4DsbwAHzQ3uq+KIOeRNQEt+L
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	05 Aug 2019 18:04:17 -0700
IronPort-SDR: /Y8JYHgdCSzYfsPZZwV8ih10XvaZvkAKoFjWdmXkGDKpzcHP53qW2f/5buIs8wQ3phMk+dyVrf
	KAYwy9hOjZlBwqlXQGu6C/Pum/UbwQQDoroMMwlbc1C3hZ6r5KV4sc9YhvVoG3SAbaNG3ADi3d
	+2ogVdxDl2EbdKO+QdOKmBnJfPw+trGnw+GIJ/gzLBYyOsSf6sFxkctIVyTb3cH6RewGmMitQh
	l61otO96qtosnIPnSgQC57UXKo2+Vxx3KhZbQtQCjTqa7XrmJSBtMKi+79sum5EZWMA1Xdsacw
	7o4=
Received: from dhcp-10-88-173-43.hgst.com (HELO localhost.localdomain)
	([10.88.173.43])
	by uls-op-cesaip01.wdc.com with ESMTP; 05 Aug 2019 18:06:26 -0700
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Mon,  5 Aug 2019 18:06:22 -0700
Message-Id: <20190806010625.27503-1-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.49]); Tue, 06 Aug 2019 01:06:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Tue, 06 Aug 2019 01:06:49 +0000 (UTC) for IP:'216.71.153.141'
	DOMAIN:'esa3.hgst.iphmx.com' HELO:'esa3.hgst.iphmx.com'
	FROM:'dmitry.fomichev@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.153.141 esa3.hgst.iphmx.com 216.71.153.141
	esa3.hgst.iphmx.com <prvs=11492cde3=dmitry.fomichev@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <damien.lemoal@wdc.com>
Subject: [dm-devel] [PATCH 0/3] dm-zoned: harden error handling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Tue, 06 Aug 2019 01:12:30 +0000 (UTC)

This series contains a few patches aimed to make dm-zoned properly
handle backing zoned storage device failures.

The following test environment was used to trigger device failures:
A 100% write file I/O fio workload was run against an XFS volume
created on top of a dm-zoned target device. The dm-zoned device,
in turn, was created on top of a zoned device provisioned by
tcmu-runner ZBC file handler. The backing storage file for the
tcmu-runner handler has been created on a separate ext4 file system.

Two different failure modes were tested -
1. Removal of the tcmu-runner device under I/O
2. Complete failure of the backing storage of tcmu-runner under I/O

In both of these test cases, dm-zoned has been observed to hang and
the only possible remedy to recover from that state was to reboot the
test system. The fio test script would also hang forever.

With these patches in place, the test script properly reports the
error and exits. After that, it is possible to remove the dm-zoned
target device and then recreate it with some working backup storage
without rebooting the system.

Dmitry Fomichev (3):
  dm-zoned: improve error handling in reclaim
  dm-zoned: improve error handling in i/o map code
  dm-zoned: properly handle backing device failure

 drivers/md/dm-zoned-metadata.c | 55 ++++++++++++++++++++------
 drivers/md/dm-zoned-reclaim.c  | 44 ++++++++++++++++-----
 drivers/md/dm-zoned-target.c   | 72 ++++++++++++++++++++++++++++++----
 drivers/md/dm-zoned.h          | 10 +++++
 4 files changed, 151 insertions(+), 30 deletions(-)

-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
