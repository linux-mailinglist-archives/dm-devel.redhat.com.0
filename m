Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E86463109DD
	for <lists+dm-devel@lfdr.de>; Fri,  5 Feb 2021 12:09:53 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-RuARSc-hOKCEbbaLZkkVDw-1; Fri, 05 Feb 2021 06:09:50 -0500
X-MC-Unique: RuARSc-hOKCEbbaLZkkVDw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA634192AB80;
	Fri,  5 Feb 2021 11:09:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A10495D9D2;
	Fri,  5 Feb 2021 11:09:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0B38218095CC;
	Fri,  5 Feb 2021 11:09:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 115B9UDY023316 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 5 Feb 2021 06:09:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D929310CD6D5; Fri,  5 Feb 2021 11:09:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA40A10C7333
	for <dm-devel@redhat.com>; Fri,  5 Feb 2021 11:09:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F578101A56C
	for <dm-devel@redhat.com>; Fri,  5 Feb 2021 11:09:27 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-389-ii2IeM6oOI-ksuV7-gEf-A-1;
	Fri, 05 Feb 2021 06:09:23 -0500
X-MC-Unique: ii2IeM6oOI-ksuV7-gEf-A-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E5CCBACBA;
	Fri,  5 Feb 2021 11:09:21 +0000 (UTC)
Message-ID: <9a3dfe98f35ca17565150447dd33d9069eddc5d5.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: lixiaokeng <lixiaokeng@huawei.com>, Benjamin Marzinski
	<bmarzins@redhat.com>, Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri, 05 Feb 2021 12:09:21 +0100
In-Reply-To: <cb16789171d381a97bbef78c968b9fdb0b29955e.camel@suse.com>
References: <20210128210852.23207-1-mwilck@suse.com>
	<c1dddccecfe0e12a2fe2dca66faad740a30acd53.camel@suse.com>
	<99488b1b-2339-338d-e951-0b8f3e78449b@huawei.com>
	<dcc6fb2a344ce75972242e2c78e2e485b58140da.camel@suse.com>
	<45fe03c8-1cc0-4318-ae84-698959667a6b@huawei.com>
	<57ec651871345e3aae745ba3a75c5f1e59bc25ef.camel@suse.com>
	<cb16789171d381a97bbef78c968b9fdb0b29955e.camel@suse.com>
User-Agent: Evolution 3.38.2
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
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] multipathd: avoid crash in uevent_cleanup()
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

On Fri, 2021-02-05 at 12:08 +0100, Martin Wilck wrote:
> On Thu, 2021-02-04 at 16:06 +0100, Martin Wilck wrote:
> 
> 
> From the LWP numbers, thread 2 and 4 are probably TUR checkers
> (temporary threads). thread 1 can't be easily identified. Could you 
> provide the stack of thread 3? From that, we might be able to infer
> which thread crashed, because multipathd always starts its threads in
> the same sequence.

btw, do you have core dumps?


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

