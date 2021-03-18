Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A833F33FD4A
	for <lists+dm-devel@lfdr.de>; Thu, 18 Mar 2021 03:36:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616035017;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mQZg6e7fqxRy+EejG4ISIlA5/QSMA3KyhnZO6RPkF8s=;
	b=M5vGGXdwj2rbjLRJsHcjQ2NWXO60XR39J/Qvhy8YpFUtS1qafPtZbGT6sTqNXMm/xUSYb+
	wJ1UDPzaoXIAFBhkVarM6BpcKkl2JbN1JnFymy7I+NcI9KrRcWOCO0ezEf5fQ9aWtx9tBl
	iBzm3oKheuLrPJGdDnJflpbmhbMUeC0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-h6XvIHxWO22er18e1a15zA-1; Wed, 17 Mar 2021 22:36:55 -0400
X-MC-Unique: h6XvIHxWO22er18e1a15zA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F7D3107B007;
	Thu, 18 Mar 2021 02:36:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E80F010016FB;
	Thu, 18 Mar 2021 02:36:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9BC5F1809C83;
	Thu, 18 Mar 2021 02:36:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12I2agVG026717 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Mar 2021 22:36:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 893DD1A880; Thu, 18 Mar 2021 02:36:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3033D1F05D;
	Thu, 18 Mar 2021 02:36:39 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 12I2ab0o013459; 
	Wed, 17 Mar 2021 21:36:38 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 12I2ab4C013458;
	Wed, 17 Mar 2021 21:36:37 -0500
Date: Wed, 17 Mar 2021 21:36:37 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20210318023637.GZ15006@octiron.msp.redhat.com>
References: <20210317172727.8364-1-mwilck@suse.com>
	<20210317172727.8364-2-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20210317172727.8364-2-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 2/2] 11-dm-mpath.rules: run "multipath -U"
	with -v1
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 17, 2021 at 06:27:27PM +0100, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> In cases where some path devices are temporarily unavailable (e.g. failover),
> high amounts of error messages such as these are seen:
> 
> Feb 27 08:02:03 ictm1608s02h1 multipath[1420]: get_udev_device: failed to look up 65:224 with type 1
> Feb 27 08:02:03 ictm1608s02h1 multipath[1420]: 3600a098000aada210000f1625de51ed9: discarding non-existing path 65:224
> 
> This is because every invocation of "multipath -U" prints these messages
> at the default log level (-v2). In the case of "multipath -U", these
> messages aren't important, and in failover situations, "multipath -U" is
> run pretty often, spamming the log with many similar messages.
> 
> Generally reducing the log level of these messages would be wrong,
> because they are important for multipathd's operation, to verify that
> multipathd does the right thing when discovering a discrepancy between the dm
> state and the devices present in the system. Therefore, just decrease the
> verbosity with which we invoke "multipath -U" in the udev rules.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
>  multipath/11-dm-mpath.rules | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/multipath/11-dm-mpath.rules b/multipath/11-dm-mpath.rules
> index cd522e8..d191ae8 100644
> --- a/multipath/11-dm-mpath.rules
> +++ b/multipath/11-dm-mpath.rules
> @@ -32,7 +32,7 @@ ACTION=="add", ENV{.MPATH_DEVICE_READY_OLD}=="1", GOTO="paths_ok"
>  
>  # Check the map state directly with multipath -U.
>  # This doesn't attempt I/O on the device.
> -PROGRAM=="$env{MPATH_SBIN_PATH}/multipath -U %k", GOTO="paths_ok"
> +PROGRAM=="$env{MPATH_SBIN_PATH}/multipath -U -v1 %k", GOTO="paths_ok"
>  ENV{MPATH_DEVICE_READY}="0", GOTO="mpath_action"
>  LABEL="paths_ok"
>  
> -- 
> 2.30.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

