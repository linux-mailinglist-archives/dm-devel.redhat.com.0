Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id DF35C27C152
	for <lists+dm-devel@lfdr.de>; Tue, 29 Sep 2020 11:34:13 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-3oCS82hCPlWSRQnGjh_-7w-1; Tue, 29 Sep 2020 05:34:10 -0400
X-MC-Unique: 3oCS82hCPlWSRQnGjh_-7w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CA29AD50D;
	Tue, 29 Sep 2020 09:34:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D3C427C29;
	Tue, 29 Sep 2020 09:34:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E6B5844A43;
	Tue, 29 Sep 2020 09:34:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08T9Y04t015169 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 29 Sep 2020 05:34:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 39AFA10F8E01; Tue, 29 Sep 2020 09:34:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34F8210F8E16
	for <dm-devel@redhat.com>; Tue, 29 Sep 2020 09:33:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2717785828B
	for <dm-devel@redhat.com>; Tue, 29 Sep 2020 09:33:58 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-448-p2Kl3kgBNYyErNMI0zc_YA-1;
	Tue, 29 Sep 2020 05:33:54 -0400
X-MC-Unique: p2Kl3kgBNYyErNMI0zc_YA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 79513AB3E;
	Tue, 29 Sep 2020 09:33:53 +0000 (UTC)
Message-ID: <afb1c6709dccc8068f0f0a38b9c26c6fb4733b74.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Frank Meinl <frank.meinl@live.de>, dm-devel@redhat.com
Date: Tue, 29 Sep 2020 11:33:52 +0200
In-Reply-To: <AM0PR09MB289766D38FDC2D4F424B95AEFE350@AM0PR09MB2897.eurprd09.prod.outlook.com>
References: <AM0PR09MB289766D38FDC2D4F424B95AEFE350@AM0PR09MB2897.eurprd09.prod.outlook.com>
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
Subject: Re: [dm-devel] [PATCH v3] libmultipath: Allow discovery of USB
 devices
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2020-09-28 at 21:09 +0200, Frank Meinl wrote:
> This change adds a new configuration option allow_usb_devices. It is
> disabled by default, so that the behavior of existing setups is not
> changed. If enabled (via multipath.conf), USB devices will be found
> during device discovery and can be used for multipath setups.
> 
> Without this option, multipath currently ignores all USB drives,
> which
> is convenient for most users. (refer also to commit 51957eb)
> 
> However, it can be beneficial to use the multipath dm-module even if
> there is only a single path to an USB attached storage. In
> combination
> with the option 'queue_if_no_path', such a setup survives a temporary
> device disconnect without any severe consequences for the running
> applications. All I/O is queued until the device reappears.
> 
> Signed-off-by: Frank Meinl <frank.meinl@live.de>

Reviewed-by: Martin Wilck <mwilck@suse.com>



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

