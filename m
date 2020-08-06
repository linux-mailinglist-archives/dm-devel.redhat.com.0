Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A6FF423DB7E
	for <lists+dm-devel@lfdr.de>; Thu,  6 Aug 2020 18:06:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-qFTubSRAOAO77YodcsPxGA-1; Thu, 06 Aug 2020 12:05:56 -0400
X-MC-Unique: qFTubSRAOAO77YodcsPxGA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BC4F58;
	Thu,  6 Aug 2020 16:05:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BE4A5C6D9;
	Thu,  6 Aug 2020 16:05:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8BE869A0EF;
	Thu,  6 Aug 2020 16:05:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076G1Gx2018553 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 12:01:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B258DF5CD2; Thu,  6 Aug 2020 16:01:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 99AFBF5CDA
	for <dm-devel@redhat.com>; Thu,  6 Aug 2020 16:01:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C9C48007D9
	for <dm-devel@redhat.com>; Thu,  6 Aug 2020 16:01:14 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-491-Fa27X4DUOoKXLd2CAtVvng-1;
	Thu, 06 Aug 2020 12:01:10 -0400
X-MC-Unique: Fa27X4DUOoKXLd2CAtVvng-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 91CB9AE0D;
	Thu,  6 Aug 2020 16:01:25 +0000 (UTC)
Message-ID: <f6e1f272856631d9904a6b3fa069bfbbfa53cf07.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Zhiqiang Liu
	<liuzhiqiang26@huawei.com>
Date: Thu, 06 Aug 2020 18:01:05 +0200
In-Reply-To: <20200728162000.GP11089@octiron.msp.redhat.com>
References: <9bc76686-747f-e85b-d25f-db5a056cf869@huawei.com>
	<20200728162000.GP11089@octiron.msp.redhat.com>
User-Agent: Evolution 3.36.4
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Yanxiaodan <yanxiaodan@huawei.com>, linfeilong@huawei.com,
	dm-devel@redhat.com, Zdenek Kabelac <zkabelac@redhat.com>
Subject: Re: [dm-devel] [PATCH] libmultipath: fix a memory leak in
 disassemble_status func
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Ben,

On Tue, 2020-07-28 at 11:20 -0500, Benjamin Marzinski wrote:
> On Tue, Jul 28, 2020 at 09:48:06PM +0800, Zhiqiang Liu wrote:
> > In disassemble_status func, for dealing with selector args,
> > word is allocated by get_word func. However, word is not freed.
> > Then a memory leak occurs.
> > 
> > Here, we call FREE(word) to free word.
> 
> Err... At the risk of sounding stupid, There is a least-pending
> selector?  Hannes, you added this code (commit 35ad40b4 "leastpending
> IO
> loadbalancing is not displayed properly"). Was this a Suse thing?  Is
> it
> still a Suse thing, or have queue-length and service-time replaced
> it?

Yes, it's a "SUSE thing" (originally developed by HP). SLE15 still
supports it; I don't know if it's actually used. 
It was discussed here last year, see:
https://patchwork.kernel.org/patch/10878905/

Regards,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

