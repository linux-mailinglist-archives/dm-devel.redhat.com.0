Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D0F14323404
	for <lists+dm-devel@lfdr.de>; Wed, 24 Feb 2021 00:00:08 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-NHJxpkctNFGDlTff2HMrUA-1; Tue, 23 Feb 2021 18:00:03 -0500
X-MC-Unique: NHJxpkctNFGDlTff2HMrUA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DD7C80196C;
	Tue, 23 Feb 2021 22:59:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E06D619C95;
	Tue, 23 Feb 2021 22:59:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9B47858076;
	Tue, 23 Feb 2021 22:59:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11NMxktk015731 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 23 Feb 2021 17:59:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C050A10EB296; Tue, 23 Feb 2021 22:59:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BAF1A10EB298
	for <dm-devel@redhat.com>; Tue, 23 Feb 2021 22:59:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 549F58919B7
	for <dm-devel@redhat.com>; Tue, 23 Feb 2021 22:59:44 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-289-fSVS6kvJPfCY6_3jCrUW9w-1;
	Tue, 23 Feb 2021 17:59:39 -0500
X-MC-Unique: fSVS6kvJPfCY6_3jCrUW9w-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id AFF4EAC69;
	Tue, 23 Feb 2021 22:59:37 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 23 Feb 2021 23:59:28 +0100
Message-Id: <20210223225930.27095-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 11NMxktk015731
X-loop: dm-devel@redhat.com
Cc: snitzer@redhat.com, Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
	Petr Vorel <pvorel@suse.cz>, dm-devel@redhat.com,
	Tushar Sugandhi <tusharsu@linux.microsoft.com>,
	linux-integrity@vger.kernel.org,
	Mimi Zohar <zohar@linux.vnet.ibm.com>, gmazyland@gmail.com, agk@redhat.com
Subject: [dm-devel] [PATCH v3 0/2]	IMA: Add test for dm-crypt measurement
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
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

Hi!

I updated Tushar's patchset to speedup things.

Changes v2->v3
* rename function s/check_ima_ascii_log_for_policy/test_policy_measurement/
* move tst_res TPASS/TFAIL into test_policy_measurement()
* drop template=ima-buf (see Lakshmi's patch [1] and discussion about
  it, it will be removed from ima_keys.sh as well)
* moved ima_dm_crypt.sh specific changes to second commit
* further API and style related cleanup

Could you please check this patchset?

Kind regards,
Petr

[1] https://patchwork.ozlabs.org/project/ltp/patch/20210222023421.12576-1-nramas@linux.microsoft.com/

Tushar Sugandhi (2):
  IMA: Generalize key measurement tests
  IMA: Add test for dm-crypt measurement

 runtest/ima                                   |  1 +
 .../kernel/security/integrity/ima/README.md   | 20 ++++++
 .../integrity/ima/tests/ima_dm_crypt.sh       | 41 +++++++++++
 .../security/integrity/ima/tests/ima_keys.sh  | 58 ++-------------
 .../security/integrity/ima/tests/ima_setup.sh | 71 +++++++++++++++++++
 5 files changed, 139 insertions(+), 52 deletions(-)
 create mode 100755 testcases/kernel/security/integrity/ima/tests/ima_dm_crypt.sh

-- 
2.30.1


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

