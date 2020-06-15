Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 40E001F9E09
	for <lists+dm-devel@lfdr.de>; Mon, 15 Jun 2020 19:04:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592240657;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=geTJYo2xaSS74PhEweoR4xV0Pi6Sv4he3ZHDOeyAQno=;
	b=h3o+74dxIF1+yDsqGkTHv4f/NH66WAvi56dWRDr2oHJZEJYOslUdNoIXLfMi2eva4RDTLs
	ieQdJAeSLf4+Jb2BjicXNfSe6dUtbc1J60khvceaXpID8hx1G2PhvlzaYiSfJf20FjCS4/
	kOKeDV8e66XLQkvIgD41HCd4AGymJsw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-plXTeKLxPVyd7nCZKT5ukA-1; Mon, 15 Jun 2020 13:04:14 -0400
X-MC-Unique: plXTeKLxPVyd7nCZKT5ukA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32C26801503;
	Mon, 15 Jun 2020 17:04:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 02FA6100164D;
	Mon, 15 Jun 2020 17:04:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C844D833C6;
	Mon, 15 Jun 2020 17:03:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05FH3i6o003427 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 15 Jun 2020 13:03:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ECF305C1D2; Mon, 15 Jun 2020 17:03:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.15.10])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A01AF5C1D4;
	Mon, 15 Jun 2020 17:03:33 +0000 (UTC)
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@redhat.com>)
	id 1jksWC-0003lK-6m; Mon, 15 Jun 2020 18:03:32 +0100
Date: Mon, 15 Jun 2020 18:03:31 +0100
From: Alasdair G Kergon <agk@redhat.com>
To: yangerkun <yangerkun@huawei.com>
Message-ID: <20200615170331.GA12312@agk-dp.fab.redhat.com>
Mail-Followup-To: yangerkun <yangerkun@huawei.com>, bgurney@redhat.com,
	agk@redhat.com, snitzer@redhat.com, dm-devel@redhat.com
References: <20200608084513.115671-1-yangerkun@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200608084513.115671-1-yangerkun@huawei.com>
Organization: Red Hat UK Ltd. Registered in England and Wales, number
	03798903. Registered Office: Peninsular House, 30-36 Monument
	Street, 4th Floor, London, England, EC3R 8NB.
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, snitzer@redhat.com, agk@redhat.com, bgurney@redhat.com
Subject: Re: [dm-devel] [PATCH 0/2] introduce interface to list all	badblocks
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Jun 08, 2020 at 04:45:11PM +0800, yangerkun wrote:
>     $ sudo dmsetup message dust1 0 listbadblocks
> The following message will appear, listing one bad block number per

Did you consider returning the data directly to the caller so it
can be accessed directly?

(e.g. like @stats_list handled in dm-stats.c)

Alasdair

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

