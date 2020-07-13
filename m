Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1315521D48C
	for <lists+dm-devel@lfdr.de>; Mon, 13 Jul 2020 13:08:40 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-fqCBCQ-AOJOEBZPaTpsDZw-1; Mon, 13 Jul 2020 07:08:36 -0400
X-MC-Unique: fqCBCQ-AOJOEBZPaTpsDZw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34980108A;
	Mon, 13 Jul 2020 11:08:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 05E8E10098AC;
	Mon, 13 Jul 2020 11:08:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 921A1180954D;
	Mon, 13 Jul 2020 11:08:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06DB8E3n016449 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 07:08:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EF1F510CD93E; Mon, 13 Jul 2020 11:08:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB2F910CD936
	for <dm-devel@redhat.com>; Mon, 13 Jul 2020 11:08:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0289800296
	for <dm-devel@redhat.com>; Mon, 13 Jul 2020 11:08:11 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-86-hu4rVYpXM8mw6xeD3FTEwA-1;
	Mon, 13 Jul 2020 07:08:07 -0400
X-MC-Unique: hu4rVYpXM8mw6xeD3FTEwA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E94DCB18C;
	Mon, 13 Jul 2020 11:08:07 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>, <lixiaokeng@huawei.com>
Date: Mon, 13 Jul 2020 13:07:39 +0200
Message-Id: <20200713110743.26329-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06DB8E3n016449
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 0/4]  Fix segfault on access to mpp->hwe
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

This is in response to Lixiaokeng's post
"master - libmultipath: fix use after free when iscsi logs in".

On top of Lixiaokeng's patch, I've added some log messages and
a fix for mpp->hwe handling in sync_paths().

The question remains how we handle maps without paths. I believe we're good
here, please review my assessment.

mpp->hwe is only accessed in propsel.c, via the mp_set_hwe() macro. Patch 3 of
my series adds an error message if this happens while mpp->hwe is NULL. IMO it
shouldn't happen because we don't check map properties for empty
maps. Normally this is done when a map is created, and we don't create maps
without paths.

The case where a map looses all paths during its normal lifetime and
can't be removed (e.g. because it's busy) is already covered by the
current code AFAICT. When a new path is re-added, we'll call adopt_paths
and verify_paths(), which will make sure that mpp->hwe is set again
to the pp->hwe member of the newly added path.

Reviews and comments welcome.

Regards
Martin

Martin Wilck (3):
  libmultipath: warn if freeing path that holds mpp->hwe
  libmultipath: warn about NULL value of mpp->hwe
  libmultipath: fix mpp->hwe handling in sync_paths()

lixiaokeng (1):
  master - libmultipath: fix use after free when iscsi logs in

 libmultipath/propsel.c     | 4 +++-
 libmultipath/structs_vec.c | 9 +++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

