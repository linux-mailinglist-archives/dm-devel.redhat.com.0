Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E9B342161BF
	for <lists+dm-devel@lfdr.de>; Tue,  7 Jul 2020 01:00:37 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-U1TuoU0xPWSaS-MbBKeUiA-1; Mon, 06 Jul 2020 19:00:33 -0400
X-MC-Unique: U1TuoU0xPWSaS-MbBKeUiA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 124D48015FD;
	Mon,  6 Jul 2020 23:00:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D76E61B7F;
	Mon,  6 Jul 2020 23:00:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1D9F072F4D;
	Mon,  6 Jul 2020 23:00:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 066MxuOJ020528 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 Jul 2020 18:59:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9D34B2EF99; Mon,  6 Jul 2020 22:59:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9926C815B
	for <dm-devel@redhat.com>; Mon,  6 Jul 2020 22:59:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92308101A525
	for <dm-devel@redhat.com>; Mon,  6 Jul 2020 22:59:54 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-147-iKl066rHMJSXlfIuRsqa0A-1;
	Mon, 06 Jul 2020 18:59:50 -0400
X-MC-Unique: iKl066rHMJSXlfIuRsqa0A-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4ECB1AC1D;
	Mon,  6 Jul 2020 22:59:49 +0000 (UTC)
Message-ID: <a16b331fa9944bae21806091307265f8d77a0780.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: "Schremmer, Steven" <Steve.Schremmer@netapp.com>, device-mapper
	development <dm-devel@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue, 07 Jul 2020 00:59:47 +0200
In-Reply-To: <DM6PR06MB52761D5DAA5DFA8B9AB23C268C690@DM6PR06MB5276.namprd06.prod.outlook.com>
References: <DM6PR06MB52761D5DAA5DFA8B9AB23C268C690@DM6PR06MB5276.namprd06.prod.outlook.com>
User-Agent: Evolution 3.36.3
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] libmultipath: add device to hwtable.c
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2020-07-06 at 20:22 +0000, Schremmer, Steven wrote:
> From: Steve Schremmer <steve.schremmer@netapp.com>
> 
> Add FUJITSU ETERNUS_AHB defaults.
> 
> Signed-off-by: Steve Schremmer <steve.schremmer@netapp.com>
> ---
>  libmultipath/hwtable.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Thanks! 

Reviewed-by: Martin Wilck <mwilck@suse.com>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

