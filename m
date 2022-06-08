Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 14059543B11
	for <lists+dm-devel@lfdr.de>; Wed,  8 Jun 2022 20:06:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654711583;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1vUaxQbAWeHV5M+OccLMna8l2iltru0KVBowde5h8Gs=;
	b=ToqlAbs9MZ/45v8sjjLupQ3T6zmYhnPPrrg4aLAVCGOtTmiFBnuIXfvTx11b2v42zFa1fR
	5+lDC7TkWupqYRUI1Ozak17MQafrKBuXlU4E5bsKyEbkylJ960NGnzO+/ImECeQ3adv/3C
	RvfoM4jcZx0sjye76y0pR32TlgrS9Xk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-GTI17JRJOm6HOXQwqmqOCw-1; Wed, 08 Jun 2022 14:06:22 -0400
X-MC-Unique: GTI17JRJOm6HOXQwqmqOCw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 170E51E7DCC0;
	Wed,  8 Jun 2022 18:06:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 36E1E2026985;
	Wed,  8 Jun 2022 18:06:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 64761194705F;
	Wed,  8 Jun 2022 18:06:15 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5D078194704E
 for <dm-devel@listman.corp.redhat.com>; Wed,  8 Jun 2022 18:06:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4E8952026985; Wed,  8 Jun 2022 18:06:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39BEE2026D64;
 Wed,  8 Jun 2022 18:06:14 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 258I6C8Y002432;
 Wed, 8 Jun 2022 13:06:12 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 258I6C1j002431;
 Wed, 8 Jun 2022 13:06:12 -0500
Date: Wed, 8 Jun 2022 13:06:11 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20220608180611.GY5254@octiron.msp.redhat.com>
References: <20220601202628.5469-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20220601202628.5469-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: Re: [dm-devel] [RFC PATCH 0/2] multipath-tools: simplify defaults
 for NVMe
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>, dm-devel@redhat.com,
 Xose Vazquez Perez <xose.vazquez@gmail.com>,
 Steven Schremmer <Steve.Schremmer@netapp.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 01, 2022 at 10:26:26PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> Using dm-multipath with NVMe devices is increasingly becoming a niche
> configuration, as it's recommended against by the kernel community and
> various vendors. Some vendors would prefer not to see their devices listed
> in the libmultipath hwtable to avoid the impression on users that this
> setup was supported by the vendor.
> 
> This RFC patch set makes it possible to remove multiple recently added
> hwtable entries by changing the generic NVMe defaults. The only
> device-specific settings that remain are those for no_path_retry.

For the set:
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

> 
> Martin Wilck (2):
>   libmultipath: hwtable: new defaults for NVMe
>   libmultipath: hwtable: remove obsolete NVMe entries
> 
>  libmultipath/hwtable.c | 30 ++----------------------------
>  1 file changed, 2 insertions(+), 28 deletions(-)
> 
> -- 
> 2.36.1
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

