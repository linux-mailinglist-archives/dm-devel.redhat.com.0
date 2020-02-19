Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 766BA165028
	for <lists+dm-devel@lfdr.de>; Wed, 19 Feb 2020 21:40:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582144815;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=exQMSWzr3CTNfC5NYxiYJl0PLC0VLv1xPAJp/rXuAgs=;
	b=MdSslqi0bslJs7xnD3umwyHt5DMAnhCTzpu+cCBDxk5a4HV5yTJUXC9aJ44yAWbZI43rmg
	QKo7rmqwwbLa7DI3ce6e8/WAtMGK7/FnBzXC+amprYquom1B9REDfW2dunvnAkCIVb79c/
	x8XamDzG6bkrAThgfGQ74uEQ8cojc1U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-ILKCYODMO8W4dR4qV4xj5w-1; Wed, 19 Feb 2020 15:40:12 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B20E0835BE9;
	Wed, 19 Feb 2020 20:40:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 564738B56D;
	Wed, 19 Feb 2020 20:40:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A663218089CD;
	Wed, 19 Feb 2020 20:39:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01JKcRIP032545 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 15:38:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D4CC82063FE6; Wed, 19 Feb 2020 20:38:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D06C62063FE5
	for <dm-devel@redhat.com>; Wed, 19 Feb 2020 20:38:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E7051017E42
	for <dm-devel@redhat.com>; Wed, 19 Feb 2020 20:38:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-221-55ds0vPPMzm4TETt_VDXcQ-1;
	Wed, 19 Feb 2020 15:38:23 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id C1B0BB1DD;
	Wed, 19 Feb 2020 20:38:21 +0000 (UTC)
Message-ID: <fcd9b7f4d012c60cf708f5ac4a99b6ef9d39528f.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>
Date: Wed, 19 Feb 2020 21:39:56 +0100
In-Reply-To: <1582143705-20886-2-git-send-email-bmarzins@redhat.com>
References: <1582143705-20886-1-git-send-email-bmarzins@redhat.com>
	<1582143705-20886-2-git-send-email-bmarzins@redhat.com>
User-Agent: Evolution 3.34.3
MIME-Version: 1.0
X-MC-Unique: 55ds0vPPMzm4TETt_VDXcQ-1
X-MC-Unique: ILKCYODMO8W4dR4qV4xj5w-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01JKcRIP032545
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH v2 1/5] multipath: fix issues found by
 compiling with gcc 10
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2020-02-19 at 14:21 -0600, Benjamin Marzinski wrote:
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  kpartx/dasd.c        |  6 +++---
>  libmultipath/print.c | 16 ++++++++--------
>  multipath/main.c     |  2 +-
>  3 files changed, 12 insertions(+), 12 deletions(-)

Reviewed-by: Martin Wilck <mwilck@suse.com>



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

