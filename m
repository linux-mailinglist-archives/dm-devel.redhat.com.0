Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 00DFC1D37C9
	for <lists+dm-devel@lfdr.de>; Thu, 14 May 2020 19:16:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589476612;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LSGi/1EzX6BOZaydaKPM4BrfN/2Od5iy4bPvZsTAa5E=;
	b=h7uwe/cjR8nwHaIDgLYlVIFh+xCt+KcLr4f9vLougQ20ej2G6GmFB3w7CrS5fPXX/02ih6
	ZpSa+5Wp6M4i8wIP5bwiCx5ivtRsm82hPqEA2nZNeMj6VjyENYo5++PW9uQeplx7G0v1X6
	aZzT9uIrQeIpjcm2slOAmEmq6ijH+64=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-vvle7T7lMwaRN28p2UCvZw-1; Thu, 14 May 2020 13:16:49 -0400
X-MC-Unique: vvle7T7lMwaRN28p2UCvZw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F4187EC1A4;
	Thu, 14 May 2020 17:16:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D2111002395;
	Thu, 14 May 2020 17:16:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 55DAF4CAB0;
	Thu, 14 May 2020 17:16:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04EHFbtK024058 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 13:15:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 53C7B2E170; Thu, 14 May 2020 17:15:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DD62261DD;
	Thu, 14 May 2020 17:15:34 +0000 (UTC)
Date: Thu, 14 May 2020 13:15:33 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Hannes Reinecke <hare@suse.de>
Message-ID: <20200514171533.GD31400@redhat.com>
References: <20200514060929.85469-1-hare@suse.de>
	<20200514060929.85469-2-hare@suse.de>
MIME-Version: 1.0
In-Reply-To: <20200514060929.85469-2-hare@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 1/2] device-mapper: use dynamic debug instead
 of compile-time config option
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
Content-Disposition: inline

On Thu, May 14 2020 at  2:09am -0400,
Hannes Reinecke <hare@suse.de> wrote:

> Switch to use dynamic debug to avoid having recompile the kernel
> just to enable debugging messages.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>

FYI, I decided to always use pr_debug* rather than preserve using printk
if CONFIG_DM_DEBUG is enabled.  More consistent and less surprising for
a developer (to have to reason through how to enable debugging).

May cause initial surprise if debugging messages disappear despite
CONFIG_DM_DEBUG being enabled... but pretty sure DM developers can cope
(and/or help non-developers) as needed.

Patches were staged for 5.8, I also added an additional related cleanup:
https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/log/?h=dm-5.8

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

