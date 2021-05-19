Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7287C389233
	for <lists+dm-devel@lfdr.de>; Wed, 19 May 2021 17:07:08 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-2c1s12zeP3yFJ6Gy71offg-1; Wed, 19 May 2021 11:07:04 -0400
X-MC-Unique: 2c1s12zeP3yFJ6Gy71offg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84D40501F8;
	Wed, 19 May 2021 15:06:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F25F25C1CF;
	Wed, 19 May 2021 15:06:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF5A9180B463;
	Wed, 19 May 2021 15:06:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14JF6ZsZ017522 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 May 2021 11:06:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 950A010545AD; Wed, 19 May 2021 15:06:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9138310EB299
	for <dm-devel@redhat.com>; Wed, 19 May 2021 15:06:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E40183395F
	for <dm-devel@redhat.com>; Wed, 19 May 2021 15:06:35 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-315--yMRptzXMLe5vEMq6WRo9A-1;
	Wed, 19 May 2021 11:06:33 -0400
X-MC-Unique: -yMRptzXMLe5vEMq6WRo9A-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F8A261042;
	Wed, 19 May 2021 14:56:57 +0000 (UTC)
Date: Wed, 19 May 2021 10:56:56 -0400
From: Sasha Levin <sashal@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Message-ID: <YKUnOBqGgfHPXX5F@sashalap>
References: <20210519074124.49890-1-ardb@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210519074124.49890-1-ardb@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: snitzer@redhat.com, stable@vger.kernel.org, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>, agk@redhat.com,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [dm-devel] [PATCH stable] dm ioctl: fix out of bounds array
 access when no devices
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

On Wed, May 19, 2021 at 09:41:24AM +0200, Ard Biesheuvel wrote:
>From: Mikulas Patocka <mpatocka@redhat.com>
>
>commit 4edbe1d7bcffcd6269f3b5eb63f710393ff2ec7a upstream.
>
>If there are not any dm devices, we need to zero the "dev" argument in
>the first structure dm_name_list. However, this can cause out of
>bounds write, because the "needed" variable is zero and len may be
>less than eight.
>
>Fix this bug by reporting DM_BUFFER_FULL_FLAG if the result buffer is
>too small to hold the "nl->dev" value.
>
>Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
>Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>Cc: stable@vger.kernel.org
>Signed-off-by: Mike Snitzer <snitzer@redhat.com>
>Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>---
>Please apply to 4.4.y and 4.9.y

We already carry this patch via the backport provided in
https://lore.kernel.org/stable/20210513094552.266451-1-nobuhiro1.iwamatsu@toshiba.co.jp/


-- 
Thanks,
Sasha

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

