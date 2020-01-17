Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id F0A3F140E66
	for <lists+dm-devel@lfdr.de>; Fri, 17 Jan 2020 16:56:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579276587;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dgnVfOt6W4eq2u5dPHjieTU2pW8AyuNcNr2ml8VPtF0=;
	b=UCpGvLZjUvCub/vBRvg2XTVA9PFFk98gr94sUSjIJzu7JQspNbNY3bmS86RS/EORqFT/pk
	lA8iwZVCa9WADOWm8UtE8hBxVjiYI4Rw4DhgGp7wm3clzXSNYj/VfvBsi9NxEvBq60SX5N
	RXUf6DE8+WOmfXgOLjbK+malkjRIGNo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-4agEEg3pOAmt7X83tk1GqQ-1; Fri, 17 Jan 2020 10:56:26 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D67DDB60;
	Fri, 17 Jan 2020 15:56:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 521BC10372F3;
	Fri, 17 Jan 2020 15:56:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5C55087091;
	Fri, 17 Jan 2020 15:56:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00HFuBPE018260 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 17 Jan 2020 10:56:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 96BEE2093CE2; Fri, 17 Jan 2020 15:56:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9259A2026D68
	for <dm-devel@redhat.com>; Fri, 17 Jan 2020 15:56:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9034F1011A8C
	for <dm-devel@redhat.com>; Fri, 17 Jan 2020 15:56:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-290-WIvIhdSPPxWrDFp1lmgibQ-1;
	Fri, 17 Jan 2020 10:56:06 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id A9A89AC50;
	Fri, 17 Jan 2020 15:56:04 +0000 (UTC)
Message-ID: <bfabcf202c74687f8493d62a53a4b53bd7e4121d.camel@suse.de>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>
Date: Fri, 17 Jan 2020 16:57:20 +0100
In-Reply-To: <1579227500-17196-6-git-send-email-bmarzins@redhat.com>
References: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
	<1579227500-17196-6-git-send-email-bmarzins@redhat.com>
User-Agent: Evolution 3.34.3
MIME-Version: 1.0
X-MC-Unique: WIvIhdSPPxWrDFp1lmgibQ-1
X-MC-Unique: 4agEEg3pOAmt7X83tk1GqQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00HFuBPE018260
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 05/15] libmultipath: constify
	get_unaligned_be*
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

On Thu, 2020-01-16 at 20:18 -0600, Benjamin Marzinski wrote:
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/unaligned.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Martin Wilck <mwilck@suse.com>



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

