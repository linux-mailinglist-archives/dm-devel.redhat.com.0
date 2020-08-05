Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 02AEE23D3A2
	for <lists+dm-devel@lfdr.de>; Wed,  5 Aug 2020 23:34:18 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-nBdF-NXwOu-SFHAosv402g-1; Wed, 05 Aug 2020 17:34:15 -0400
X-MC-Unique: nBdF-NXwOu-SFHAosv402g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9688A10059AA;
	Wed,  5 Aug 2020 21:34:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1D8C5C1D2;
	Wed,  5 Aug 2020 21:34:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4F04496926;
	Wed,  5 Aug 2020 21:34:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 075LV73j020925 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Aug 2020 17:31:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 727192063239; Wed,  5 Aug 2020 21:31:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D4F02049CA0
	for <dm-devel@redhat.com>; Wed,  5 Aug 2020 21:31:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 621B2800883
	for <dm-devel@redhat.com>; Wed,  5 Aug 2020 21:31:04 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-50-sAQy1rYRMdCsK-B3SZ6PxA-1;
	Wed, 05 Aug 2020 17:31:02 -0400
X-MC-Unique: sAQy1rYRMdCsK-B3SZ6PxA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 033D4ACAF;
	Wed,  5 Aug 2020 21:31:18 +0000 (UTC)
Message-ID: <03adb8c54f9da84e997afa8ce354f46e3961d094.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: lutianxiong <lutianxiong@huawei.com>, "christophe.varoqui@opensvc.com"
	<christophe.varoqui@opensvc.com>
Date: Wed, 05 Aug 2020 23:31:00 +0200
In-Reply-To: <9458f4d0a17f98b4791e21efc91e779335edfb6f.camel@suse.com>
References: <B8F26E5D3A1269458BE7CD6D60E9885F7A369633@dggemm531-mbx.china.huawei.com>
	<9458f4d0a17f98b4791e21efc91e779335edfb6f.camel@suse.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Liaoqingwei <liaoqingwei@huawei.com>
Subject: Re: [dm-devel] libmultipath: fix null dereference
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

On Wed, 2020-08-05 at 23:28 +0200, Martin Wilck wrote:
> On Thu, 2020-07-23 at 01:11 +0000, lutianxiong wrote:
> > 
> > Check if udev_device_get_devtype return NULL before dereferencing
> > it.
> >  
> > Signed-off-by: lutianxiong <lutianxiong@huawei.com>
> 
> Thanks, this looks correct. But could you please resend in proper
> format? The patch is corrupt, looks like mangled whitespace.
> 

I just saw that you did already, so forget about my previous request,
and thanks again.

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

