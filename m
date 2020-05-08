Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 430261CB858
	for <lists+dm-devel@lfdr.de>; Fri,  8 May 2020 21:34:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588966450;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Zdq+ncnROGZ6970sQVqdKC2LQD3t+UKVyhNfOr1N2BU=;
	b=C9SWSvkbYlKfqOuYoAb9nIBFTpIq6R3wMxkZdcAtV+0aJVHKtoa8Wg6KsMZRZp0ZvZGEyu
	fUQkyAHtkpDs4xHgtnnd4J8jGZEKPzqOyh8U0mQ9T8r2XqnuoKTQ9p+/YkD6a7h7zynEAj
	OpKhc1J6D+bOxFhrn6FInoOL8AQfZpI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-xSj2jkAuNbG_BxBLT6qFbg-1; Fri, 08 May 2020 15:34:04 -0400
X-MC-Unique: xSj2jkAuNbG_BxBLT6qFbg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDB0C100CCC2;
	Fri,  8 May 2020 19:33:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08FD960CD1;
	Fri,  8 May 2020 19:33:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 584C14CAAD;
	Fri,  8 May 2020 19:33:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 048JXjqe011964 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 May 2020 15:33:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A2D792029F77; Fri,  8 May 2020 19:33:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DAB12029F6F
	for <dm-devel@redhat.com>; Fri,  8 May 2020 19:33:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F97C802641
	for <dm-devel@redhat.com>; Fri,  8 May 2020 19:33:45 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-342-cWqgSd5xORegcEjGw5v1Zg-1;
	Fri, 08 May 2020 15:33:40 -0400
X-MC-Unique: cWqgSd5xORegcEjGw5v1Zg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 8FC1CAD2A;
	Fri,  8 May 2020 19:33:41 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri,  8 May 2020 21:33:00 +0200
Message-Id: <20200508193302.11401-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 048JXjqe011964
X-loop: dm-devel@redhat.com
Cc: "George, Martin" <Martin.George@netapp.com>, dm-devel@redhat.com,
	Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 0/2] multipath-tools: disable foreign libraries
	by default
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Hi Christophe,

This is a follow-up to the previous discussion with topic 'RFC:
multipath-tools: NVMe native multipath and default setting for
"enable_foreign"'. Upon Netapp's initiative, I'd asked for foreign
libraries to be disabled by default. Ben had replied he'd agree,
and suggested implementing a "-e" option for multipath to enable
all foreign libraries:

https://www.redhat.com/archives/dm-devel/2020-February/msg00271.html

This patch set implements this idea.

Regards,
Martin


Martin Wilck (2):
  libmultipath: set "enable_foreign" to NONE by default
  multipath: add "-e" option to enable foreign libraries

 libmultipath/defaults.h    |  4 ++--
 multipath/main.c           | 11 ++++++++++-
 multipath/multipath.8      |  6 ++++++
 multipath/multipath.conf.5 |  5 +++--
 4 files changed, 21 insertions(+), 5 deletions(-)

-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

