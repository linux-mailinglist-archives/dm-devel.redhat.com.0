Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 9143B1C4674
	for <lists+dm-devel@lfdr.de>; Mon,  4 May 2020 20:55:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588618531;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=epsWaHm4tyqbIxBElQWvJ0K4Oo7L2j2bjSbMQ9Tsp/8=;
	b=bA453RwpmLaClgdLJcM7RZPzGMsBz8O4/H+NPfiJQGsmO9xmicNZ0ViZP1VhhH7skogVCu
	SA+6vVoTLFoa0q0rh2xgEHhnYzfk0BsD+ky3y/o5YO6NV+bJAUjlJHz5iBXEb53zR+gCce
	Xb62VIxeyqWUx4vwjC23vPY/ATSUrwo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-EJ6V-uJiONGDj4u2qKG4CA-1; Mon, 04 May 2020 14:55:27 -0400
X-MC-Unique: EJ6V-uJiONGDj4u2qKG4CA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F03481840408;
	Mon,  4 May 2020 18:55:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 234955C1D4;
	Mon,  4 May 2020 18:55:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 17FC51809540;
	Mon,  4 May 2020 18:55:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 044Istbw024800 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 4 May 2020 14:54:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A0CD3100405A; Mon,  4 May 2020 18:54:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D04C1004C57
	for <dm-devel@redhat.com>; Mon,  4 May 2020 18:54:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 493278727D8
	for <dm-devel@redhat.com>; Mon,  4 May 2020 18:54:53 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
	[209.85.166.181]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-392-_o19lZ7WPnagXBvyyFYU0Q-1; Mon, 04 May 2020 14:54:50 -0400
X-MC-Unique: _o19lZ7WPnagXBvyyFYU0Q-1
Received: by mail-il1-f181.google.com with SMTP id w6so12331096ilg.1
	for <dm-devel@redhat.com>; Mon, 04 May 2020 11:54:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=1iql/vgMAHaxcicd3q8BWhB5xV7kpRHGdYSm3EQZges=;
	b=hwp6qjoLLhvgXtopthjHpaLRd9+IXyn+oJUU+WvnJmkPzvh9p8/m+wOGCjOD1T0VgG
	C3TVhOzk85Ox6XGSyMRsVJGp8CyhLHpXivdX8dmmP81be5q8Lq8gG8Lpko7PTEhI7Okd
	vnbeSyQZsbEhgFhbacxb+imJD9mjufMEWKkxLhRF+eGWTo8r66Nip7UrxRm/dghL2U7b
	aX3kmwEXJn73q/GWGZUPj+W8dANW6H0PLPZT1wpQmxhnwJ3RfklAAtkrX4pEfSTsip5U
	BI0KJVmRPP0CUVvIf9exl1phY8u4gb97VF8mKzdMBh8/09olLHI5z9Qn+kuntHVHIuel
	5w6g==
X-Gm-Message-State: AGi0PuZbddAyl4SdKN0wAFshy0mjgcN9a2VYdpcBRgNaQQ1swjxLG9Rg
	5riindqV7MtYTyU/hH6GGtNAcBSDC3E76bnzm9U98VPhDHY=
X-Google-Smtp-Source: APiQypKl8yrChavaT8ERgPRv1coHmmqJp1KaMHX3ZGT77R5hUKkFzI02kfYfLCM0W0bsbOzKAUkkef+IkIcgp34+WH8=
X-Received: by 2002:a92:2912:: with SMTP id l18mr17809054ilg.28.1588618484089; 
	Mon, 04 May 2020 11:54:44 -0700 (PDT)
MIME-Version: 1.0
From: Drew Hastings <dhastings@crucialwebhost.com>
Date: Mon, 4 May 2020 11:54:33 -0700
Message-ID: <CAN-y+ELN7GW5hiOQcK7nTe-_A9XdJExQUEuy7MmiJhzsZTf0+A@mail.gmail.com>
To: dm-devel@redhat.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Subject: [dm-devel] Thin provisioning bug in dm-thin
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============2513565294338581763=="

--===============2513565294338581763==
Content-Type: multipart/alternative; boundary="0000000000006d9b2d05a4d7107d"

--0000000000006d9b2d05a4d7107d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

In process_create_snap_mesg, when dm_thinner_pool_create_snap fails, the
DMWARN is for ARGV[1] and ARGV[2], but should be for 0 and 1.

--0000000000006d9b2d05a4d7107d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">In=C2=A0process_create_snap_mesg, when dm_thinner_pool_cre=
ate_snap fails, the DMWARN is for ARGV[1] and ARGV[2], but should be for 0 =
and 1.<br></div>

--0000000000006d9b2d05a4d7107d--

--===============2513565294338581763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--===============2513565294338581763==--

