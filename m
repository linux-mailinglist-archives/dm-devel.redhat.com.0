Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 329B1244282
	for <lists+dm-devel@lfdr.de>; Fri, 14 Aug 2020 02:24:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-uzFPxkjcNcSNb_OYt_n_6w-1; Thu, 13 Aug 2020 20:24:53 -0400
X-MC-Unique: uzFPxkjcNcSNb_OYt_n_6w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83AE41008542;
	Fri, 14 Aug 2020 00:24:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 43DED62A19;
	Fri, 14 Aug 2020 00:24:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 57C594EE16;
	Fri, 14 Aug 2020 00:24:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07E0OGVj024288 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 Aug 2020 20:24:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C3176110C56D; Fri, 14 Aug 2020 00:24:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE86E110C567
	for <dm-devel@redhat.com>; Fri, 14 Aug 2020 00:24:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9AB6F811E76
	for <dm-devel@redhat.com>; Fri, 14 Aug 2020 00:24:13 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-534-YgdpXmLWNhKCS7e85iS6Zw-1; Thu, 13 Aug 2020 20:24:11 -0400
X-MC-Unique: YgdpXmLWNhKCS7e85iS6Zw-1
Received: by mail-wr1-f53.google.com with SMTP id f12so6819203wru.13
	for <dm-devel@redhat.com>; Thu, 13 Aug 2020 17:24:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=yt6cVgFqi9oYD4/yb0mdT6+NWFzbN0HojBczG6n9GEk=;
	b=SSm6sMNMz1X6ZS7e1lgMbbU57gJUMO/IAD0rXl2KB55G92AjdIyjVPFqo6JueYwB0w
	zcRdD0RgfcoG/AFMezp42anYNEyROmMMYCtVMXTp1liGAl7RMuCZUOuFPVhDIeG62FQZ
	W5uWnMsRsFZV0hBVlWzk9R44QkUCAviWPdaSMDoz8CWrT7Znj7wDHWGnpTZbKTU+RXx4
	PiqyHRij8MewE9jLBpTWxDcFzjsDUSSFfxLen+uePNn2fMMmoek3rplHC4cKLG6XGpkc
	nXCWhRjz+4H3J3IKGgrrut++6L3wHNBMEfJUQedJA2Ep2FaWRWvXrQquu/oqp6lZ4KXf
	LFtg==
X-Gm-Message-State: AOAM531yW3XwaaEh9B5fu/NBa+5ayD3JoemRMn1E4CVIgWQMYBrQvzcE
	eXjE1pg8XCaqO0v3wbjyBPbJ5FA=
X-Google-Smtp-Source: ABdhPJyQZ5K2gDsK/Ew8hKpHwYlw7Y4DAHpEAy0Y7aqQXlRLYIuoVayz2N+Yg1s7h/5esweRmeqSWA==
X-Received: by 2002:adf:d84c:: with SMTP id k12mr230117wrl.250.1597364649689; 
	Thu, 13 Aug 2020 17:24:09 -0700 (PDT)
Received: from localhost (201.red-83-37-180.dynamicip.rima-tde.net.
	[83.37.180.201]) by smtp.gmail.com with ESMTPSA id
	l1sm13013401wrb.12.2020.08.13.17.24.09
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 13 Aug 2020 17:24:09 -0700 (PDT)
To: "McIntyre, Vincent (CASS, Marsfield)" <Vincent.Mcintyre@csiro.au>
References: <20200810043316.GH21810@mayhem.atnf.CSIRO.AU>
	<8c910ecb-ddf8-0a91-4310-4daedb85cd89@gmail.com>
	<20200813235143.GB2644@mayhem.atnf.CSIRO.AU>
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
Message-ID: <f9f8c62f-fa97-dbcb-52dd-503d392df95f@gmail.com>
Date: Fri, 14 Aug 2020 02:24:08 +0200
MIME-Version: 1.0
In-Reply-To: <20200813235143.GB2644@mayhem.atnf.CSIRO.AU>
Content-Language: en-US
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] Promise and ALUA
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 8/14/20 1:51 AM, McIntyre, Vincent (CASS, Marsfield) wrote:

> TL;DR I found a way forward, manually running multipath -a.
> Details below, and a suggested tweak to the manpage.
> 
> I created a new LUN on the vtrak and mapped it to the test host.
> The host sees it, but as expected there's no new multipath yet.
> lsscsi does not show a new set of scsi devices either,
> which is also expected.
> 
>   qla2xxx [0000:04:00.0]-107ff:1: qla2x00_fcport_event_handler: schedule
>   qla2xxx [0000:04:00.0]-107ff:1: qla_scan_work_fn: schedule loop resync
>   qla2xxx [0000:04:00.0]-280e:1: HBA in F P2P topology.
>   qla2xxx [0000:04:00.0]-2814:1: Configure loop -- dpc flags = 0x60.
>   qla2xxx [0000:04:00.0]-107ff:1: qla2x00_fcport_event_handler: schedule
>   qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 250100015553ce36 pn 260700015553ce36 portid=1e0260.
>   qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 250100015553ce36 pn 260600015553ce36 portid=1e0280.
>   qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 250000015553ce36 pn 260200015553ce36 portid=1e02a0.
>   qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 250000015553ce36 pn 260300015553ce36 portid=1e02c0.
>   qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 250000015553ce36 pn 260100015553ce36 portid=1e0300.
>   qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 250000015553ce36 pn 260000015553ce36 portid=1e0320.
>   qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 250100015553ce36 pn 260500015553ce36 portid=1e0340.
>   qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 250100015553ce36 pn 260400015553ce36 portid=1e0360.
>   qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 20000024ff002350 pn 21000024ff002350 portid=1e0500.
>   qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 200200a098b16b5f pn 203300a098b16b5f portid=1e08a0.
>   qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 200200a098b16b5f pn 203200a098b16b5f portid=1e08a1.
>   qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 200200a098b16b5f pn 206300a098b16b5f portid=1e08c0.
>   qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 200200a098b16b5f pn 204200a098b16b5f portid=1e08c1.
>   qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 200200a098b16b5f pn 204300a098b16b5f portid=1e0900.
>   qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 200200a098b16b5f pn 205200a098b16b5f portid=1e0920.
>   qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 200200a098b16b5f pn 205300a098b16b5f portid=1e0940.
>   qla2xxx [0000:04:00.0]-107ff:1: qla_scan_work_fn: schedule loop resync
>   qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 200200a098b16b5f pn 206200a098b16b5f portid=1e0960.
>   qla2xxx [0000:04:00.0]-286a:1: qla2x00_configure_loop *** FAILED ***.
>   qla2xxx [0000:04:00.0]-280e:1: HBA in F P2P topology.
>   qla2xxx [0000:04:00.0]-2814:1: Configure loop -- dpc flags = 0x60.
>   qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 250100015553ce36 pn 260700015553ce36 portid=1e0260.
>   qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 250100015553ce36 pn 260600015553ce36 portid=1e0280.
>   qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 250000015553ce36 pn 260200015553ce36 portid=1e02a0.
>   qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 250000015553ce36 pn 260300015553ce36 portid=1e02c0.
>   qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 250000015553ce36 pn 260100015553ce36 portid=1e0300.
>   qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 250000015553ce36 pn 260000015553ce36 portid=1e0320.
>   qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 250100015553ce36 pn 260500015553ce36 portid=1e0340.
>   qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 250100015553ce36 pn 260400015553ce36 portid=1e0360.
>   qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 20000024ff002350 pn 21000024ff002350 portid=1e0500.
>   qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 200200a098b16b5f pn 203300a098b16b5f portid=1e08a0.
>   qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 200200a098b16b5f pn 203200a098b16b5f portid=1e08a1.
>   qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 200200a098b16b5f pn 206300a098b16b5f portid=1e08c0.
>   qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 200200a098b16b5f pn 204200a098b16b5f portid=1e08c1.
>   qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 200200a098b16b5f pn 204300a098b16b5f portid=1e0900.
>   qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 200200a098b16b5f pn 205200a098b16b5f portid=1e0920.
>   qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 200200a098b16b5f pn 205300a098b16b5f portid=1e0940.
>   qla2xxx [0000:04:00.0]-2858:1: GID_PT entry - nn 200200a098b16b5f pn 206200a098b16b5f portid=1e0960.
>   qla2xxx [0000:04:00.0]-289f:1: Device wrap (1e0960).
>   qla2xxx [0000:04:00.0]-2869:1: LOOP READY.
>   qla2xxx [0000:04:00.0]-286b:1: qla2x00_configure_loop: exiting normally.
> 
> I emptied /etc/multipath.conf, ran update-initramfs -u and rebooted.
> lsscsi shows multiple paths to the new LUN, but there's no new
> multipath - all those shown below were already known to the system.
> On earlier versions, the new multipath usually appeared automatically.
> 
> # multipath -ll
> 
> 3600a098000b173f60000079e5da82d73 dm-12 DELL,MD38xxf
> size=40T features='5 queue_if_no_path pg_init_retries 50 queue_mode mq' hwhandler='1 rdac' wp=rw
> |-+- policy='service-time 0' prio=14 status=active
> | |- 1:0:10:0  sdaa 65:160 active ready running
> | |- 1:0:12:0  sdac 65:192 active ready running
> | |- 1:0:14:0  sdae 65:224 active ready running
> | `- 1:0:8:0   sdy  65:128 active ready running
> `-+- policy='service-time 0' prio=9 status=enabled
>    |- 1:0:11:0  sdab 65:176 active ready running
>    |- 1:0:13:0  sdad 65:208 active ready running
>    |- 1:0:7:0   sdx  65:112 active ready running
>    `- 1:0:9:0   sdz  65:144 active ready running
> Aug 14 09:33:02 | sdd: alua not supported
> Aug 14 09:33:02 | sdg: alua not supported
> Aug 14 09:33:02 | sdag: alua not supported
> Aug 14 09:33:02 | sdj: alua not supported
> Aug 14 09:33:02 | sdm: alua not supported
> Aug 14 09:33:02 | sdp: alua not supported
> Aug 14 09:33:02 | sds: alua not supported
> Aug 14 09:33:02 | sdv: alua not supported
> 222e300015555469c dm-10 Promise,VTrak E830f
> size=20T features='3 queue_if_no_path queue_mode mq' hwhandler='0' wp=rw
> `-+- policy='service-time 0' prio=-1 status=active
>    |- 1:0:0:20  sdd  8:48   active ready running
>    |- 1:0:1:20  sdg  8:96   active ready running
>    |- 1:0:15:20 sdag 66:0   active ready running
>    |- 1:0:2:20  sdj  8:144  active ready running
>    |- 1:0:3:20  sdm  8:192  active ready running
>    |- 1:0:4:20  sdp  8:240  active ready running
>    |- 1:0:5:20  sds  65:32  active ready running
>    `- 1:0:6:20  sdv  65:80  active ready running
> Aug 14 09:33:02 | sdc: alua not supported
> Aug 14 09:33:02 | sdf: alua not supported
> Aug 14 09:33:02 | sdaf: alua not supported
> Aug 14 09:33:02 | sdi: alua not supported
> Aug 14 09:33:02 | sdl: alua not supported
> Aug 14 09:33:02 | sdo: alua not supported
> Aug 14 09:33:02 | sdr: alua not supported
> Aug 14 09:33:02 | sdu: alua not supported
> 2221f000155c0792e dm-11 Promise,VTrak E830f
> size=20T features='3 queue_if_no_path queue_mode mq' hwhandler='0' wp=rw
> `-+- policy='service-time 0' prio=-1 status=active
>    |- 1:0:0:5   sdc  8:32   active ready running
>    |- 1:0:1:5   sdf  8:80   active ready running
>    |- 1:0:15:5  sdaf 65:240 active ready running
>    |- 1:0:2:5   sdi  8:128  active ready running
>    |- 1:0:3:5   sdl  8:176  active ready running
>    |- 1:0:4:5   sdo  8:224  active ready running
>    |- 1:0:5:5   sdr  65:16  active ready running
>    `- 1:0:6:5   sdu  65:64  active ready running
> 
> However I find that I can do this:
> 
> # multipath -v 3 -a 2228a0001558b1855
> Aug 14 09:35:56 | set open fds limit to 1048576/1048576
> Aug 14 09:35:56 | loading //lib/multipath/libchecktur.so checker
> Aug 14 09:35:56 | checker tur: message table size = 3
> Aug 14 09:35:56 | loading //lib/multipath/libprioconst.so prioritizer
> Aug 14 09:35:56 | foreign library "nvme" loaded successfully
> Aug 14 09:35:56 | libdevmapper version 1.02.155 (2018-12-18)
> Aug 14 09:35:56 | DM multipath kernel driver v1.13.0
> Aug 14 09:35:56 | No matching alias [2228a0001558b1855] in bindings file.
> Aug 14 09:35:56 | wrote wwid 2228a0001558b1855 to wwids file
> wwid '2228a0001558b1855' added
> Aug 14 09:35:56 | unloading const prioritizer
> Aug 14 09:35:56 | unloading tur checker
> 
> # multipath -v3 -r
> Aug 14 09:36:24 | set open fds limit to 1048576/1048576
> Aug 14 09:36:24 | loading //lib/multipath/libchecktur.so checker
> Aug 14 09:36:24 | checker tur: message table size = 3
> Aug 14 09:36:24 | loading //lib/multipath/libprioconst.so prioritizer
> Aug 14 09:36:24 | foreign library "nvme" loaded successfully
> Aug 14 09:36:24 | delegating command to multipathd
> 
> and now the multipath device for the new LUN appears.
> 
> # multipath -ll
> 3600a098000b173f60000079e5da82d73 dm-12 DELL,MD38xxf
> size=40T features='5 queue_if_no_path pg_init_retries 50 queue_mode mq' hwhandler='1 rdac' wp=rw
> |-+- policy='service-time 0' prio=14 status=active
> | |- 1:0:10:0  sdaa 65:160 active ready running
> | |- 1:0:12:0  sdac 65:192 active ready running
> | |- 1:0:14:0  sdae 65:224 active ready running
> | `- 1:0:8:0   sdy  65:128 active ready running
> `-+- policy='service-time 0' prio=9 status=enabled
>    |- 1:0:11:0  sdab 65:176 active ready running
>    |- 1:0:13:0  sdad 65:208 active ready running
>    |- 1:0:7:0   sdx  65:112 active ready running
>    `- 1:0:9:0   sdz  65:144 active ready running
> Aug 14 09:36:35 | sdd: alua not supported
> Aug 14 09:36:35 | sdg: alua not supported
> Aug 14 09:36:35 | sdag: alua not supported
> Aug 14 09:36:35 | sdj: alua not supported
> Aug 14 09:36:35 | sdm: alua not supported
> Aug 14 09:36:35 | sdp: alua not supported
> Aug 14 09:36:35 | sds: alua not supported
> Aug 14 09:36:35 | sdv: alua not supported
> 222e300015555469c dm-10 Promise,VTrak E830f
> size=20T features='3 queue_if_no_path queue_mode mq' hwhandler='0' wp=rw
> `-+- policy='service-time 0' prio=-1 status=active
>    |- 1:0:0:20  sdd  8:48   active ready running
>    |- 1:0:1:20  sdg  8:96   active ready running
>    |- 1:0:15:20 sdag 66:0   active ready running
>    |- 1:0:2:20  sdj  8:144  active ready running
>    |- 1:0:3:20  sdm  8:192  active ready running
>    |- 1:0:4:20  sdp  8:240  active ready running
>    |- 1:0:5:20  sds  65:32  active ready running
>    `- 1:0:6:20  sdv  65:80  active ready running
> Aug 14 09:36:35 | sde: alua not supported
> Aug 14 09:36:35 | sdh: alua not supported
> Aug 14 09:36:35 | sdah: alua not supported
> Aug 14 09:36:35 | sdk: alua not supported
> Aug 14 09:36:35 | sdn: alua not supported
> Aug 14 09:36:35 | sdq: alua not supported
> Aug 14 09:36:35 | sdt: alua not supported
> Aug 14 09:36:35 | sdw: alua not supported
> 2228a0001558b1855 dm-14 Promise,VTrak E830f
> size=20T features='3 queue_if_no_path queue_mode mq' hwhandler='0' wp=rw
> `-+- policy='service-time 0' prio=-1 status=active
>    |- 1:0:0:21  sde  8:64   active ready running
>    |- 1:0:1:21  sdh  8:112  active ready running
>    |- 1:0:15:21 sdah 66:16  active ready running
>    |- 1:0:2:21  sdk  8:160  active ready running
>    |- 1:0:3:21  sdn  8:208  active ready running
>    |- 1:0:4:21  sdq  65:0   active ready running
>    |- 1:0:5:21  sdt  65:48  active ready running
>    `- 1:0:6:21  sdw  65:96  active ready running
> Aug 14 09:36:35 | sdc: alua not supported
> Aug 14 09:36:35 | sdf: alua not supported
> Aug 14 09:36:35 | sdaf: alua not supported
> Aug 14 09:36:35 | sdi: alua not supported
> Aug 14 09:36:35 | sdl: alua not supported
> Aug 14 09:36:35 | sdo: alua not supported
> Aug 14 09:36:35 | sdr: alua not supported
> Aug 14 09:36:35 | sdu: alua not supported
> 2221f000155c0792e dm-11 Promise,VTrak E830f
> size=20T features='3 queue_if_no_path queue_mode mq' hwhandler='0' wp=rw
> `-+- policy='service-time 0' prio=-1 status=active
>    |- 1:0:0:5   sdc  8:32   active ready running
>    |- 1:0:1:5   sdf  8:80   active ready running
>    |- 1:0:15:5  sdaf 65:240 active ready running
>    |- 1:0:2:5   sdi  8:128  active ready running
>    |- 1:0:3:5   sdl  8:176  active ready running
>    |- 1:0:4:5   sdo  8:224  active ready running
>    |- 1:0:5:5   sdr  65:16  active ready running
>    `- 1:0:6:5   sdu  65:64  active ready running
> 
> So it seems that multipath can be made to work, but perhaps
> the manual page could be enhanced a little to cover this case.
> 
> diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
> index 05a5e8ff..718dd16a 100644
> --- a/multipath/multipath.conf.5
> +++ b/multipath/multipath.conf.5
> @@ -1516,6 +1516,9 @@ handler to known devices (which includes all devices supporting SCSI-3 ALUA)
>   and disallow changing the handler
>   afterwards. Setting \fBhardware_handler\fR for such devices on these kernels
>   has no effect.
> +.PP
> +If your device has been configured to disable ALUA support,
> +\fBhardware_handler\fR will be set to \fI0\fR.
>   .RE
>   .
>   .

If E830f is an Active-Active array without ALUA support,
add to /etc/multipath.conf:

devices {
         device {
                 vendor "Promise"
                 product "VTrak"
                 product_blacklist "VTrak V-LUN"
                 path_grouping_policy "multibus"
                 detect_prio "no"
                 hardware_handler ""
                 prio "const"
                 failback "manual"
                 no_path_retry 30
         }
}

run update-initramfs, and reboot.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

