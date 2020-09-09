Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4E537262CE4
	for <lists+dm-devel@lfdr.de>; Wed,  9 Sep 2020 12:13:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-ta01YJzWMaiNQOpHzK17IA-1; Wed, 09 Sep 2020 06:13:00 -0400
X-MC-Unique: ta01YJzWMaiNQOpHzK17IA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0303393B4;
	Wed,  9 Sep 2020 10:12:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6765838BE;
	Wed,  9 Sep 2020 10:12:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 572BA9730F;
	Wed,  9 Sep 2020 10:12:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 089ABO6B010615 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 9 Sep 2020 06:11:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 93A422156A36; Wed,  9 Sep 2020 10:11:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D1D32156A2D
	for <dm-devel@redhat.com>; Wed,  9 Sep 2020 10:11:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E94838E6997
	for <dm-devel@redhat.com>; Wed,  9 Sep 2020 10:11:18 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-464-JytXahD8MzmEI5p90Pjlsw-1;
	Wed, 09 Sep 2020 06:11:14 -0400
X-MC-Unique: JytXahD8MzmEI5p90Pjlsw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1653CAE67;
	Wed,  9 Sep 2020 10:11:14 +0000 (UTC)
Message-ID: <3ae3e9fdc5692b5d5244e58e777a18c14bda5abd.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: lixiaokeng <lixiaokeng@huawei.com>, Benjamin Marzinski
	<bmarzins@redhat.com>
Date: Wed, 09 Sep 2020 12:11:12 +0200
In-Reply-To: <3154dc82-e5cf-5d34-6955-04a0ad6e01f0@huawei.com>
References: <37544d4c-950f-4281-3b66-e4d1884c5167@huawei.com>
	<40cf77df-eaa3-fb72-69fd-9f865d12dc34@huawei.com>
	<20200904213048.GE11108@octiron.msp.redhat.com>
	<8dd72a70-991a-cb7d-3279-3d5036df1b9d@huawei.com>
	<20200908154540.GK11108@octiron.msp.redhat.com>
	<c50b9997b3c4a55d6a2858cd6b931bea93b14bfe.camel@suse.com>
	<3154dc82-e5cf-5d34-6955-04a0ad6e01f0@huawei.com>
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
Cc: dm-devel, list <dm-devel@redhat.com>, linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH 09/14] libmultipath: check whether
 mp->features is NULl in, assemble_map
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2020-09-09 at 11:18 +0800, lixiaokeng wrote:
> 
> On 2020/9/9 0:35, Martin Wilck wrote:
> > 
> > What about this:
> > 
> > assemble_map() is only called from setup_map(), which sets mp-
> > >features 
> > in select_features(). So what we should do is check for NULL after
> > select_features(), or have that function return an error code if
> > strdup
> > fails, and bail out early in setup_map() in that case.
> > 
> > Then we simply need to add a comment in assemble_map() saying that 
> > mp->features must be non-null when this function is called.
> > 
> > As I said earlier, I'm of course not against checking function
> > parameters, but here we should fail to setup a "struct multipath"
> > in
> > the first place in setup map(), rather than returning an
> > incompletely
> > initialized one. If we handle it this way, we don't need to check
> > the
> > fields of struct multipath over and over again. Similar arguments
> > hold
> > for other structs.
> > 
> > Of course this kind of assumption needs to be better documented in
> > the
> > code.
> > 
> > Regards
> > Martin
> > 
> > 
> Hi Martin,
>    If I don't misunderstand, we check feature after select_features
> and
> return 1 if feature is NULL in setup_map. We delete strdup and add
> message "mp->features must be non-null" in assemble_map. Like this:
> ---
> select_features(conf, mpp);
> if (!mpp->featrues)
> 	return 1;
> 
> ---
> /* mp->feature must not be NULL */
> APPEND(p, end, "%s %s %i %i", mp->features, mp->hwhandler
> ---

Yes. I guess error handling in setup_map() needs a closer look, too.

Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

