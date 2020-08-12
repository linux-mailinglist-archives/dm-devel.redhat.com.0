Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D70E22428BD
	for <lists+dm-devel@lfdr.de>; Wed, 12 Aug 2020 13:34:44 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-qcF7VV2jMVSOnPEeJKF_7w-1; Wed, 12 Aug 2020 07:34:40 -0400
X-MC-Unique: qcF7VV2jMVSOnPEeJKF_7w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AB8410BF;
	Wed, 12 Aug 2020 11:34:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D74DB600C5;
	Wed, 12 Aug 2020 11:34:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 53730181A06B;
	Wed, 12 Aug 2020 11:34:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07CBYUNA028574 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Aug 2020 07:34:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A75B4D0161; Wed, 12 Aug 2020 11:34:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A2B38D019C
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:34:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C38780088F
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:34:29 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-460-HAjnXO5iMBuaFrULJuuhow-1;
	Wed, 12 Aug 2020 07:34:24 -0400
X-MC-Unique: HAjnXO5iMBuaFrULJuuhow-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7BEFEAE0A;
	Wed, 12 Aug 2020 11:34:44 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 12 Aug 2020 13:34:03 +0200
Message-Id: <20200812113405.26206-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07CBYUNA028574
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 00/42] multipath-tools series part III:
	duplicate alias
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Hi Christophe, hi Ben,

This is part III of a larger patch series for multpath-tools I've been preparing.
It contains fixes for a customer issue where the same alias was set for
several maps with different WWIDs in the WWIDs file.

Note that this does *not* break the scenario Ben described in his response to
v1 of the part of the series. Details in the commit message of patch 41/42.

This part based on the previously submitted part II (which is completely
unchanged from the v1 submission and not re-posted).

The full series will also be available here:
https://github.com/mwilck/multipath-tools/tree/ups/submit-2008
This part is tagged "submit-200812-3".

Changes v1 -> v2, as suggested by Ben Marzinski:

 * 40/42 "libmultipath: refuse creating map with duplicate alias"
    - dropped, as this breaks valid scenarios
 * 40/42 "libmultipath: free_multipath(): remove mpp references"
    - new patch added, required to avoid segfaults; inserted here to preserve
      numbering
 * 41/42 "libmultipath: refuse reloading an existing map with different WWID"
    - unchanged, but not reviewed yet. Commit message improved.

NOTE: part VI and VII of the the series contain patches related to the topic
of this part, improving the handling of inconsistent alias settings further:

  80/80 "libmultipath: select_action(): don't drop map if alias clashes"
  84/84 "libmultipath: add consistency check for alias settings"

Regards,
Martin

Martin Wilck (3):
  libmultipath: free_multipath(): remove mpp references
  libmultipath: refuse reloading an existing map with different WWID
  libmultipath: dm_addmap(): refuse creating map with empty WWID

 libmultipath/configure.c | 19 +++++++++++++++----
 libmultipath/devmapper.c | 26 +++++++++++++++-----------
 libmultipath/structs.c   | 15 +++++++++++++++
 3 files changed, 45 insertions(+), 15 deletions(-)

-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

