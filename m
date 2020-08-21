Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD7724D6AD
	for <lists+dm-devel@lfdr.de>; Fri, 21 Aug 2020 15:55:33 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-BVQ7bRDfNlS-tk4D2_M9PQ-1; Fri, 21 Aug 2020 09:55:29 -0400
X-MC-Unique: BVQ7bRDfNlS-tk4D2_M9PQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AADB61885D8F;
	Fri, 21 Aug 2020 13:55:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B32B7C534;
	Fri, 21 Aug 2020 13:55:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 88F6C183D021;
	Fri, 21 Aug 2020 13:55:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LDtD0b002972 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 09:55:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4F524201E6AC; Fri, 21 Aug 2020 13:55:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B6312017E80
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 13:55:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F11028A5DE6
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 13:55:10 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-549-B1iCMQC0Mw2YKUsToS4D-Q-1;
	Fri, 21 Aug 2020 09:55:08 -0400
X-MC-Unique: B1iCMQC0Mw2YKUsToS4D-Q-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8A2DAAE93;
	Fri, 21 Aug 2020 13:55:34 +0000 (UTC)
From: mwilck@suse.com
To: lixiaokeng@huawei.com
Date: Fri, 21 Aug 2020 15:54:15 +0200
Message-Id: <20200821135418.28138-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07LDtD0b002972
X-loop: dm-devel@redhat.com
Cc: Martin Wilck <mwilck@suse.com>, dm-devel@redhat.com,
	Zhiqiang Liu <liuzhiqiang26@huawei.com>
Subject: [dm-devel] [PATCH 0/3] discard broken maps in get_dm_mpvec
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Hello lixiaokeng,

please check if this fixes the issue you reported in
"libmultipath fix NULL dereference in select_action"
(https://www.redhat.com/archives/dm-devel/2020-August/msg00246.html).

As discussed before, the idea is to discard broken / incompletely
initialized maps in get_dm_mpvec().

Regards
Martin

Martin Wilck (3):
  libmultipath: update_multipath_table(): add flags argument
  libmultipath: remove_map(): separate pathvec and mpvec arguments
  multipath: get_dm_mpvec: discard broken maps

 libmultipath/configure.c   | 11 ++++++-----
 libmultipath/structs_vec.c | 20 ++++++++++----------
 libmultipath/structs_vec.h | 10 +++++++---
 multipath/main.c           | 23 +++++++++--------------
 multipathd/dmevents.c      |  2 +-
 multipathd/main.c          | 16 ++++++++--------
 6 files changed, 41 insertions(+), 41 deletions(-)

-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

