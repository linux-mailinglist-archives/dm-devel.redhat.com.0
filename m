Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1B214279BFB
	for <lists+dm-devel@lfdr.de>; Sat, 26 Sep 2020 20:55:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-lnDGxtXEPICzN9B6lzuvqA-1; Sat, 26 Sep 2020 14:55:47 -0400
X-MC-Unique: lnDGxtXEPICzN9B6lzuvqA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7677B10066FA;
	Sat, 26 Sep 2020 18:55:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E0651002D41;
	Sat, 26 Sep 2020 18:55:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D5DEE1832FC1;
	Sat, 26 Sep 2020 18:55:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08QIt6Z5000993 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 26 Sep 2020 14:55:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 216D594654; Sat, 26 Sep 2020 18:55:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D2219464C
	for <dm-devel@redhat.com>; Sat, 26 Sep 2020 18:55:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCCB9858294
	for <dm-devel@redhat.com>; Sat, 26 Sep 2020 18:55:03 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-236-FaXkJmqMMbmKZMjvAHG1CA-1;
	Sat, 26 Sep 2020 14:55:01 -0400
X-MC-Unique: FaXkJmqMMbmKZMjvAHG1CA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8B84BAC65;
	Sat, 26 Sep 2020 18:54:59 +0000 (UTC)
Message-ID: <e6325f41106fbc2da29b00bdd4a77a4ee4a2f5a9.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Frank Meinl <frank.meinl@live.de>, dm-devel@redhat.com
Date: Sat, 26 Sep 2020 20:54:58 +0200
In-Reply-To: <AM0PR09MB289702395C44596866E4B9C3FE370@AM0PR09MB2897.eurprd09.prod.outlook.com>
References: <AM0PR09MB289702395C44596866E4B9C3FE370@AM0PR09MB2897.eurprd09.prod.outlook.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 1/2] libmultipath: Allow discovery of USB
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 2020-09-26 at 18:26 +0200, Frank Meinl wrote:
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

Sorry, I forgot in the previous review: You must add an entry for 
SCSI_PROTOCOL_USB in snprint_path_protocol(). Apart from that, this
looks OK.

Regards,
Martin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

