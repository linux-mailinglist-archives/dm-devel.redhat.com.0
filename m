Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 41546248BC7
	for <lists+dm-devel@lfdr.de>; Tue, 18 Aug 2020 18:38:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-KJSfJztaOBypxQnFmpIEDA-1; Tue, 18 Aug 2020 12:38:44 -0400
X-MC-Unique: KJSfJztaOBypxQnFmpIEDA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEBC418686D0;
	Tue, 18 Aug 2020 16:38:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4DDF60BFA;
	Tue, 18 Aug 2020 16:38:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 19BA6181A870;
	Tue, 18 Aug 2020 16:38:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07IGbBe7017256 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 18 Aug 2020 12:37:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E8BED2166BDB; Tue, 18 Aug 2020 16:37:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2D1E2166B28
	for <dm-devel@redhat.com>; Tue, 18 Aug 2020 16:37:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15AEC9B4480
	for <dm-devel@redhat.com>; Tue, 18 Aug 2020 16:37:08 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-501-yEEGAk7kMPu8NCVgemGJlw-1;
	Tue, 18 Aug 2020 12:37:02 -0400
X-MC-Unique: yEEGAk7kMPu8NCVgemGJlw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5E4A4AB89;
	Tue, 18 Aug 2020 16:37:26 +0000 (UTC)
Message-ID: <fb04916036613edb59dfd470c449a1a199cd03ff.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: lixiaokeng <lixiaokeng@huawei.com>, Benjamin Marzinski
	<bmarzins@redhat.com>, Christophe Varoqui <christophe.varoqui@opensvc.com>,
	dm-devel@redhat.com
Date: Tue, 18 Aug 2020 18:36:59 +0200
In-Reply-To: <8fd64929-cb4b-5267-1899-15a82e2ff678@huawei.com>
References: <5ef5f58e-3a27-8959-3abb-4b4c401cc309@huawei.com>
	<8fd64929-cb4b-5267-1899-15a82e2ff678@huawei.com>
User-Agent: Evolution 3.36.5
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linfeilong@huawei.com, liuzhiqiang26@huawei.com
Subject: Re: [dm-devel] [PATCH 3/5] multipathd: add reclear_pp_from_mpp in
 ev_remove_path
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2020-08-18 at 21:08 +0800, lixiaokeng wrote:
> Add reclear_pp_from_mpp in ev_remove_path to make sure that pp is
> cleared in mpp.
> 
> When multipathd del path xxx, multipathd -v2, multipathd add path xxx
> and multipath -U
> dm-x are executed simultaneously, multipath -U dm-x will case
> coredump.
> 
> The reason is that there are two paths with same dev_t in dm_table.
> The process
> is as follows:

Thanks for the report.

With which code have you tested this? I have reason to believe that 
it would behave differently with my last patch series (in particular,
part V "removed path handling") applied. I'm not sure if my series
would fix the issue, but it would probably need a different fix.

Regards,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

