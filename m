Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C53E32DC676
	for <lists+dm-devel@lfdr.de>; Wed, 16 Dec 2020 19:28:36 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-nfkDv0fzM7ypQniw7DNb_Q-1; Wed, 16 Dec 2020 13:28:33 -0500
X-MC-Unique: nfkDv0fzM7ypQniw7DNb_Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D23E318C8C00;
	Wed, 16 Dec 2020 18:28:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D41DC10016FF;
	Wed, 16 Dec 2020 18:28:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A12834BB40;
	Wed, 16 Dec 2020 18:28:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BGIOoNH019409 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 16 Dec 2020 13:24:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6497F10FFE67; Wed, 16 Dec 2020 18:24:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6077E10FFE4B
	for <dm-devel@redhat.com>; Wed, 16 Dec 2020 18:24:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7685101A563
	for <dm-devel@redhat.com>; Wed, 16 Dec 2020 18:24:45 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-243-O2SOXuqtPbmQZUd0NF8bRw-1;
	Wed, 16 Dec 2020 13:24:41 -0500
X-MC-Unique: O2SOXuqtPbmQZUd0NF8bRw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7FD31AC7B;
	Wed, 16 Dec 2020 18:24:39 +0000 (UTC)
Message-ID: <a47c7eba65f40d87711ad7f4c81ea5b947c1e0d0.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Date: Wed, 16 Dec 2020 19:24:38 +0100
In-Reply-To: <20201216181708.22224-1-mwilck@suse.com>
References: <20201216181708.22224-1-mwilck@suse.com>
User-Agent: Evolution 3.36.5
MIME-Version: 1.0
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
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v3 00/29] libmultipath: improve cleanup on
	exit
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

On Wed, 2020-12-16 at 19:16 +0100, mwilck@suse.com wrote:
> 
> This series is based on the previous series "multipath-tools:
> shutdown, 
> libdevmapper races, globals" (v3).
> 

I forgot to mention: 

The previous 2 series

   "multipath-tools: shutdown,  libdevmapper races, globals" (v3)
   "multipath-tools:add linker version scripts" (v2)

got fully acked by Ben and have been pushed to my "upstream-queue"
branch: https://github.com/openSUSE/multipath-tools/tree/upstream-queue

The current series is based on these two.

Regards,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

