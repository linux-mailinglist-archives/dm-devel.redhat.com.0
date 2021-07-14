Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7A6973C83F6
	for <lists+dm-devel@lfdr.de>; Wed, 14 Jul 2021 13:36:45 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-mDm4nKdvOeCV6rNyiX2YVg-1; Wed, 14 Jul 2021 07:36:42 -0400
X-MC-Unique: mDm4nKdvOeCV6rNyiX2YVg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40D62100CCD1;
	Wed, 14 Jul 2021 11:36:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E44B71981C;
	Wed, 14 Jul 2021 11:36:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C13EB4EA29;
	Wed, 14 Jul 2021 11:36:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16EBa2HZ010859 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 14 Jul 2021 07:36:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9D9F52168696; Wed, 14 Jul 2021 11:36:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 998362168695
	for <dm-devel@redhat.com>; Wed, 14 Jul 2021 11:35:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F7811078460
	for <dm-devel@redhat.com>; Wed, 14 Jul 2021 11:35:59 +0000 (UTC)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
	[85.215.255.50]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-299-1aZqoRtNOQa1iay9DyA75A-1; Wed, 14 Jul 2021 07:35:55 -0400
X-MC-Unique: 1aZqoRtNOQa1iay9DyA75A-1
X-RZG-AUTH: ":IW0NeWC8c+zN1nIYOgi8rPKEoKABwRR6O3/XVYQwcrYSSclzVPtV9u1ghAtu"
X-RZG-CLASS-ID: mo00
Received: from USER-PC.fritz.box by smtp.strato.de (RZmta 47.28.1 DYNA|AUTH)
	with ESMTPSA id 30791cx6EBWpw99
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
	Wed, 14 Jul 2021 13:32:51 +0200 (CEST)
From: Thore Sommer <public@thson.de>
To: tusharsu@linux.microsoft.com
Date: Wed, 14 Jul 2021 13:32:41 +0200
Message-Id: <20210714113241.28580-1-public@thson.de>
In-Reply-To: <20210713004904.8808-1-tusharsu@linux.microsoft.com>
References: <20210713004904.8808-1-tusharsu@linux.microsoft.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: snitzer@redhat.com, zohar@linux.ibm.com, nramas@linux.microsoft.com,
	dm-devel@redhat.com, linux-integrity@vger.kernel.org, agk@redhat.com
Subject: Re: [dm-devel] [PATCH 0/7] device mapper target measurements using
	IMA
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

Thank you for bringing IMA support to device mapper. The addition of dm-verity
to IMA is very useful for the project I'm working on where we boot
our distribution from removable USB media.

One of our goals is to detect tampering of the root file system remotely.
Therefore we enabled dm-verity support but implementing remote attestation for
dm-verity from userland is not ideal which was our initial plan.

This patch set enables us to leverage to already implemented IMA attestation
infrastructure by the remote attestation service that we are using (Keylime)
without trying to roll a custom solution.

We tested the initial RFC patch set and will continue testing with this one to
see if it fully works in our environment and with our use case.

Thore Sommer

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

