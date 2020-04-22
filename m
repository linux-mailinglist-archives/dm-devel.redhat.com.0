Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 886631B4AC4
	for <lists+dm-devel@lfdr.de>; Wed, 22 Apr 2020 18:43:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587573836;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rJ1JkKW0I4nsoc65tfzP32+j781Va5bFhZgoTZC9aZc=;
	b=QaNim3w/TtlKbANtbiXZrwcRnlkmMLgpnVOlqK2K6Woeopc9Dq2hdwrR3JlVuj0deYpIiF
	6yeoM2cCmDL+02SY+sHtDaLxc2vBM4eV/gNsGVJckW9rORerz7uDYu6bbYDA3U3qF85tee
	2I/afTeymvsQhp5WAFtxeKIUKYOZwYU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-uISDyLoNOeSZDQSkl6N9rg-1; Wed, 22 Apr 2020 12:43:51 -0400
X-MC-Unique: uISDyLoNOeSZDQSkl6N9rg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB38E8017F5;
	Wed, 22 Apr 2020 16:43:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB3B85D706;
	Wed, 22 Apr 2020 16:43:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 976611809541;
	Wed, 22 Apr 2020 16:43:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03MGhHdA022713 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 Apr 2020 12:43:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9719520230A6; Wed, 22 Apr 2020 16:43:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 932D62026D66
	for <dm-devel@redhat.com>; Wed, 22 Apr 2020 16:43:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32F8A80CDB4
	for <dm-devel@redhat.com>; Wed, 22 Apr 2020 16:43:14 +0000 (UTC)
Received: from namei.org (namei.org [65.99.196.166]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-437-pmp6EbO8M5iTBJGlIOQZkw-1;
	Wed, 22 Apr 2020 12:43:11 -0400
X-MC-Unique: pmp6EbO8M5iTBJGlIOQZkw-1
Received: from localhost (localhost [127.0.0.1])
	by namei.org (8.14.4/8.14.4) with ESMTP id 03MGgnwT012761;
	Wed, 22 Apr 2020 16:42:49 GMT
Date: Thu, 23 Apr 2020 02:42:49 +1000 (AEST)
From: James Morris <jmorris@namei.org>
To: deven.desai@linux.microsoft.com
In-Reply-To: <20200415162550.2324-6-deven.desai@linux.microsoft.com>
Message-ID: <alpine.LRH.2.21.2004230234420.12318@namei.org>
References: <20200415162550.2324-1-deven.desai@linux.microsoft.com>
	<20200415162550.2324-6-deven.desai@linux.microsoft.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03MGhHdA022713
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, sashal@kernel.org,
	John Johansen <john.johansen@canonical.com>,
	pasha.tatashin@soleen.com, snitzer@redhat.com, jannh@google.com,
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	dm-devel@redhat.com, zohar@linux.ibm.com,
	mdsakib@linux.microsoft.com, linux-block@vger.kernel.org,
	nramas@linux.microsoft.com, linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com, Chad Sellers <csellers@tresys.com>,
	linux-integrity@vger.kernel.org, jaskarankhurana@linux.microsoft.com,
	Stephen Smalley <sds@tycho.nsa.gov>, agk@redhat.com,
	"Serge E. Hallyn" <serge@hallyn.com>
Subject: Re: [dm-devel] [RFC PATCH v3 05/12] fs: add security blob and hooks
 for block_device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 15 Apr 2020, deven.desai@linux.microsoft.com wrote:

> From: Deven Bowers <deven.desai@linux.microsoft.com>
> 
> Add a security blob and associated allocation, deallocation and set hooks
> for a block_device structure.
> 
> Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>

Is there any feedback from block or LSM folk on the addition of a security 
blob for block_device here?

IPE uses this is to track the status of integrity verification of e.g. 
DM-Verity devices, per this code from a subsequent patch:


+       ret = security_bdev_setsecurity(dm_table_get_md(v->ti->table)->bdev,
+                                       DM_VERITY_SIGNATURE_SEC_NAME,
+                                       v->sig->sig, v->sig->sig_size);


-- 
James Morris
<jmorris@namei.org>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

