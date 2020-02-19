Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E9E5116406F
	for <lists+dm-devel@lfdr.de>; Wed, 19 Feb 2020 10:30:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582104633;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/nMag96H4IfUdS/VUSg51fIGf8CAprEccfOcGqkW9Ig=;
	b=WYqmzne5ZsyKODx+f0EYaJB7S2U31JVz0LReuNZscpWapyFP5NtOO4861Yz0SqZFpmBL6x
	zJdNYx7rAZ5vkznqrembq/LWEoXnZaxAOJvgH2O/Wsw29q6AJ5HJM+H/hJx41ezUjSCzVc
	l1WpFPOrer5KIyby+y6nMXlzs0ErGeM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-qxBKNrA_Nhump8UKziJ3hw-1; Wed, 19 Feb 2020 04:30:30 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49B9B800D4E;
	Wed, 19 Feb 2020 09:30:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F26290F7C;
	Wed, 19 Feb 2020 09:30:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 15A5B35AF3;
	Wed, 19 Feb 2020 09:30:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J9UFfg026831 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 04:30:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F0BEE10E4D1B; Wed, 19 Feb 2020 09:30:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC51E10031FB
	for <dm-devel@redhat.com>; Wed, 19 Feb 2020 09:30:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1BEC686D70C
	for <dm-devel@redhat.com>; Wed, 19 Feb 2020 09:30:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-278-WpquN9O-P0WFWsagMFvMeQ-1;
	Wed, 19 Feb 2020 04:30:10 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 66DE6AF2F;
	Wed, 19 Feb 2020 09:30:09 +0000 (UTC)
Message-ID: <d6a0e4cd4d91c4f933aadc0252fb11e452ed3f12.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>
Date: Wed, 19 Feb 2020 10:31:44 +0100
In-Reply-To: <1582095273-10279-3-git-send-email-bmarzins@redhat.com>
References: <1582095273-10279-1-git-send-email-bmarzins@redhat.com>
	<1582095273-10279-3-git-send-email-bmarzins@redhat.com>
User-Agent: Evolution 3.34.3
MIME-Version: 1.0
X-MC-Unique: WpquN9O-P0WFWsagMFvMeQ-1
X-MC-Unique: qxBKNrA_Nhump8UKziJ3hw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01J9UFfg026831
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 2/5] libmultipath: turn pp->vpd_data into a
	pointer
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

On Wed, 2020-02-19 at 00:54 -0600, Benjamin Marzinski wrote:
> Instead of always allocating space in the path structure for
> vpd_data,
> only allocte it when necessary.
> 
> Also, fix comments on vpd tests
> 
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/discovery.c | 17 +++++++++++++++--
>  libmultipath/print.c     |  4 ++--
>  libmultipath/structs.c   |  3 +++
>  libmultipath/structs.h   |  2 +-
>  tests/vpd.c              |  3 ++-
>  5 files changed, 23 insertions(+), 6 deletions(-)

Reviewed-by: Martin Wilck <mwilck@suse.com>



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

