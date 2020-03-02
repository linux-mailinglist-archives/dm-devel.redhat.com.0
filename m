Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4130D1766C7
	for <lists+dm-devel@lfdr.de>; Mon,  2 Mar 2020 23:21:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583187683;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XgCZ4HfUN9LpB6fhrJhQ+sNvAyEOVFUq+Lw4wyphAO0=;
	b=XnZDCFjcM0ZdWKlzxfEPSnmIOnG5m1VwpKXlIIgHsqZlDrDefzc+mmQ5VvGrwIe8DgmeAq
	luviYUuDqytSAP4TyG2IyW6TPABn7GDHJ9I60i4kn1l4oxVnb6CouKB7KIfu0kZgHa3Cm+
	2wsRT5wYaZVUWDr9+JE/L3J+W2+l2pg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-ubhDb57_N4e_rlke-6CJkQ-1; Mon, 02 Mar 2020 17:21:20 -0500
X-MC-Unique: ubhDb57_N4e_rlke-6CJkQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7F031005510;
	Mon,  2 Mar 2020 22:21:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 56FAE5C21A;
	Mon,  2 Mar 2020 22:21:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A618684460;
	Mon,  2 Mar 2020 22:21:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 022MKwVr003564 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 2 Mar 2020 17:20:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CAA70D93C9; Mon,  2 Mar 2020 22:20:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C704EDBF27
	for <dm-devel@redhat.com>; Mon,  2 Mar 2020 22:20:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECB3C800307
	for <dm-devel@redhat.com>; Mon,  2 Mar 2020 22:20:56 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-374-E8Ro3XCcN5K6Pv4auGcfOg-1;
	Mon, 02 Mar 2020 17:20:55 -0500
X-MC-Unique: E8Ro3XCcN5K6Pv4auGcfOg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 3E8C9B332;
	Mon,  2 Mar 2020 22:20:53 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Mon,  2 Mar 2020 23:20:21 +0100
Message-Id: <20200302222025.21022-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 022MKwVr003564
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 0/4] multipath-tools unit test fixups
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Hi Christophe, hi Ben,

as announced in my previous post, here's a set of minor fixups for the
unit tests. The README.md should have been created long ago. My main
issue is that I'd prefer not to have a file under git control that is
likely to be customized in every developer's environment and needs
to be stashed away before every serious git work.

Martin Wilck (4):
  Remove tests/directio_test_dev
  tests/Makefile: allow setting DIO_TEST_DEV in the environment
  tests/Makefile: add test_clean target
  tests: add README.md

 tests/Makefile          | 13 +++++---
 tests/README.md         | 72 +++++++++++++++++++++++++++++++++++++++++
 tests/directio_test_dev |  4 ---
 3 files changed, 81 insertions(+), 8 deletions(-)
 create mode 100644 tests/README.md
 delete mode 100644 tests/directio_test_dev

-- 
2.25.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

