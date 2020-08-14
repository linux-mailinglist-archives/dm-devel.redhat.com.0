Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0476824452C
	for <lists+dm-devel@lfdr.de>; Fri, 14 Aug 2020 09:04:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-ZqTvjtsZN_GyCIlRttLjdA-1; Fri, 14 Aug 2020 03:04:45 -0400
X-MC-Unique: ZqTvjtsZN_GyCIlRttLjdA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A1B251AE;
	Fri, 14 Aug 2020 07:04:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52A1C100AE51;
	Fri, 14 Aug 2020 07:04:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0E029180B657;
	Fri, 14 Aug 2020 07:04:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07E2IxEj006659 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 Aug 2020 22:19:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 989CB2166BA4; Fri, 14 Aug 2020 02:18:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92DD62166BA3
	for <dm-devel@redhat.com>; Fri, 14 Aug 2020 02:18:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91B2F85A5A5
	for <dm-devel@redhat.com>; Fri, 14 Aug 2020 02:18:57 +0000 (UTC)
Received: from act-MTAout6.csiro.au (act-mtaout6.csiro.au [150.229.7.43])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-404-mwYE_yirOXqhoziFsFZCUA-1; Thu, 13 Aug 2020 22:18:54 -0400
X-MC-Unique: mwYE_yirOXqhoziFsFZCUA-1
IronPort-SDR: sDd3zyaxdFNAU/+ejAcXPA+e1myyfcDJ4GybjImL0WUUTDIXfitr5ESOoGayKzobMgfQxfCiGA
	LgBah69KkLOQ==
X-SBRS: 5.1
IronPort-PHdr: =?us-ascii?q?9a23=3A/uaD/xLVr1ilWhBksNmcpTVXNCE6p7X5OBIU4Z?=
	=?us-ascii?q?M7irVIN76u5InmIFeGvK4/g1rAXIGd4PVB2KLasKHlDGoH55vJ8HUPa4dFWB?=
	=?us-ascii?q?JNj8IK1xchD8iIBQyeTrbqYiU2Ed4EWApj+He2YkdQEcf6IVbVpy764TsbAB?=
	=?us-ascii?q?6qMw1zK6z8EZLTiMLi0ee09tXTbgxEiSD7b6l1KUC9tgTLsY8fnNhv?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A+FZAABa8zVflwCwBSSwhIATAJKcgDJ?=
	=?us-ascii?q?fHAEBAQEBAQcBARIBAQQEAQFAgTkEAQELAYFRUWIVgTMKhC2DRgONWZopgRE?=
	=?us-ascii?q?DVQsBAQEMAhsSAgQBAQKBAzABgxYCF4IqAiQ3Bg4CAwEBCwEBBgEBAQEBBgQ?=
	=?us-ascii?q?CAhABAQEBAR4GhgwMg1OBAgEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQEBAQEFAoEHBT4BAQEDEhERDAEBNwEPAgEIGAICJgICAhIeFRIEDie?=
	=?us-ascii?q?DBAGCSwMtAQEEqDMCgTmIYAEBdYEygwEBAQV7hCQYgg4JCQGBBCoBgnCDYIZ?=
	=?us-ascii?q?AgVw+gRABgxA+hBUOGheDADOCLY9qCiOCaKMtBwMggkKIY5EqAg0hgn6BI5t?=
	=?us-ascii?q?0lCCYfYRNAgQCBAUCDgEBBYFpgXxsgz0JRxcCDY4fDA4Jg06GcYNldDcCBgo?=
	=?us-ascii?q?BAQMJfI1CgTQBgRABAQ?=
X-IPAS-Result: =?us-ascii?q?A+FZAABa8zVflwCwBSSwhIATAJKcgDJfHAEBAQEBAQcBA?=
	=?us-ascii?q?RIBAQQEAQFAgTkEAQELAYFRUWIVgTMKhC2DRgONWZopgREDVQsBAQEMAhsSA?=
	=?us-ascii?q?gQBAQKBAzABgxYCF4IqAiQ3Bg4CAwEBCwEBBgEBAQEBBgQCAhABAQEBAR4Gh?=
	=?us-ascii?q?gwMg1OBAgEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEFA?=
	=?us-ascii?q?oEHBT4BAQEDEhERDAEBNwEPAgEIGAICJgICAhIeFRIEDieDBAGCSwMtAQEEq?=
	=?us-ascii?q?DMCgTmIYAEBdYEygwEBAQV7hCQYgg4JCQGBBCoBgnCDYIZAgVw+gRABgxA+h?=
	=?us-ascii?q?BUOGheDADOCLY9qCiOCaKMtBwMggkKIY5EqAg0hgn6BI5t0lCCYfYRNAgQCB?=
	=?us-ascii?q?AUCDgEBBYFpgXxsgz0JRxcCDY4fDA4Jg06GcYNldDcCBgoBAQMJfI1CgTQBg?=
	=?us-ascii?q?RABAQ?=
Received: from exch2-cdc.nexus.csiro.au ([IPv6:2405:b000:601:13::247:32])
	by act-ironport-int.csiro.au with ESMTP/TLS/ECDHE-RSA-AES256-SHA384;
	14 Aug 2020 12:18:48 +1000
Received: from exch4-cdc.nexus.csiro.au (2405:b000:601:13::247:34) by
	exch2-cdc.nexus.csiro.au (2405:b000:601:13::247:32) with Microsoft SMTP
	Server (TLS) id 15.0.1497.2; Fri, 14 Aug 2020 12:18:36 +1000
Received: from ExEdge1.csiro.au (150.229.7.34) by exch4-cdc.nexus.csiro.au
	(152.83.247.34) with Microsoft SMTP Server (TLS) id 15.0.1497.2 via
	Frontend Transport; Fri, 14 Aug 2020 12:18:36 +1000
Received: from AUS01-SY3-obe.outbound.protection.outlook.com (104.47.117.54)
	by ExEdge1.csiro.au (150.229.7.34) with Microsoft SMTP Server (TLS) id
	15.0.1497.2; Fri, 14 Aug 2020 12:18:30 +1000
Received: from MEAPR01MB4517.ausprd01.prod.outlook.com (2603:10c6:220:3c::18)
	by ME2PR01MB2356.ausprd01.prod.outlook.com (2603:10c6:201:19::11)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16;
	Fri, 14 Aug 2020 02:18:35 +0000
Received: from MEAPR01MB4517.ausprd01.prod.outlook.com
	([fe80::80c9:72d0:91b9:8d4e]) by
	MEAPR01MB4517.ausprd01.prod.outlook.com
	([fe80::80c9:72d0:91b9:8d4e%7]) with mapi id 15.20.3283.016;
	Fri, 14 Aug 2020 02:18:35 +0000
From: "McIntyre, Vincent (CASS, Marsfield)" <Vincent.Mcintyre@csiro.au>
To: Xose Vazquez Perez <xose.vazquez@gmail.com>
Thread-Topic: [dm-devel] Promise and ALUA
Thread-Index: AQHWbs9fLG+eDTnEKkiNCju3lFnLRak2fTaAgABHy/aAAB/NgA==
Date: Fri, 14 Aug 2020 02:18:35 +0000
Message-ID: <20200814021835.GD2644@mayhem.atnf.CSIRO.AU>
References: <20200810043316.GH21810@mayhem.atnf.CSIRO.AU>
	<8c910ecb-ddf8-0a91-4310-4daedb85cd89@gmail.com>
	<20200813235143.GB2644@mayhem.atnf.CSIRO.AU>
	<f9f8c62f-fa97-dbcb-52dd-503d392df95f@gmail.com>
In-Reply-To: <f9f8c62f-fa97-dbcb-52dd-503d392df95f@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [130.155.194.144]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a24e388e-0eb6-417f-400b-08d83ff8597e
x-ms-traffictypediagnostic: ME2PR01MB2356:
x-microsoft-antispam-prvs: <ME2PR01MB2356FFCA40CD8B6AAD7BFA27F4400@ME2PR01MB2356.ausprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IxVZLTyAZRwQXkZuGgkbQmzrA08gOslFzcC9ESbOCtD7asjzJq1sTSy8R2XrCeKYCBsHjr34Z+XhtLBMP8wtGKAv9wte89xCqZZZ+DGPgz3IjdhW3TYXCZ5yWLe1KY9WOgO7EYApQVpFIfGN0E98vZKK+fN30nR1k2CAmZt1FEmIgYdG5NT1MEy/66aj/gE/mFYqZZBrjY5VUrQJn+Wg8/SSAl/l+8tp6XksS3umAqv3e+MC9XS5G8O3TQG0Jf9B6804eLUrBzLBAmjbeoqjyG6IkwdCXL8HkyW0sNJIyRw5GAzGzKWx4mhjabmMgih5qXAAiDw1myf2lMgEjR+BWQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:MEAPR01MB4517.ausprd01.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(346002)(376002)(366004)(39860400002)(396003)(136003)(186003)(8936002)(83380400001)(86362001)(8676002)(6486002)(2906002)(71200400001)(6512007)(26005)(33656002)(6916009)(4326008)(66476007)(478600001)(6506007)(316002)(4001150100001)(66556008)(66946007)(64756008)(66446008)(5660300002)(1076003)(76116006)(91956017);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: 9tJ/lL3XPPAhNP/ilxJ1fTFPTVF5lBaQngs4TRxP1r/8XvGRN+ixULHsmT4gGDz12xOiNvEJkgb5oN7KdSj5kvU6v5Shpv9JfKhRMzKIJ1UTfyyY7+dxBRI+u6kwICEEHs2maHScR18SpjkW8FEPzTpL4l4oC1hl3/JoveYMzMkwGfFcTFkwWioCQDaf7+GoIvrm7z0x4Pj0KD6no9LRdCBFiU+0/V7BniAiTBnjZf6Tfs0fB8j8JTWyFr1vU5Z5ek3cyVyduRVx9xPH46CAr7OIpTz2iXak/4G1wtCQbqmeUW+u+6hm432EHSJZ6wtYkmsBuHKD7JXBJDwcxn2/fLuKsiHf6XJoGSuLyVdqGbKU+6aF7sgqymToomgZN89LM+5oCYt6XMD04CQcOZEJeAKezeTYnA92z5Azkg9yVvrHRIAc4qDH8ieJrnfEoiwVE9ZXLE1B8GEXou8NKVP2lY/lBoHe0nUNxZKLpuq8PfHZ8fLnBAi0XeOQ+PgdzHggXLLiRA+tCg1rqItpxFyxi5FAUIV9icsI8F0CzBwFlzRaHyXtQcdW0kPlZM5Z/ysQTlK/T28qBns8RCuiKfuDWeKIiFsG9dfcIIWj/zakvKr4cL1T6E1aQWhNQ1QY2YN4gIEc8uKJoHlOazr16lTC/A==
x-ms-exchange-transport-forked: True
Content-ID: <CD314DBDE1DFCD4084F70AA64B708D51@ausprd01.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MEAPR01MB4517.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a24e388e-0eb6-417f-400b-08d83ff8597e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2020 02:18:35.7491 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0fe05593-19ac-4f98-adbf-0375fce7f160
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: plgEictyRSVFkTvAShSf6Qwot9mFyfjvyGrh6XOdzjevU/yP8Rpw3AeGsdnwckm3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME2PR01MB2356
X-OriginatorOrg: csiro.au
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07E2IxEj006659
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 14 Aug 2020 03:04:01 -0400
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 14, 2020 at 02:24:08AM +0200, Xose Vazquez Perez wrote:
>
>If E830f is an Active-Active array without ALUA support,
>add to /etc/multipath.conf:
>
>devices {
>        device {
>                vendor "Promise"
>                product "VTrak"
>                product_blacklist "VTrak V-LUN"
>                path_grouping_policy "multibus"
>                detect_prio "no"
>                hardware_handler ""
>                prio "const"
>                failback "manual"
>                no_path_retry 30
>        }
>}
>
>run update-initramfs, and reboot.

I updated multipath.conf as above, ran update-initramfs.
# cat /etc/multipath.conf
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

Also, I removed the wwid of the test LUN

# multipath -v 3 -w 2228a0001558b1855
Aug 14 11:52:54 | set open fds limit to 1048576/1048576
Aug 14 11:52:54 | loading //lib/multipath/libchecktur.so checker
Aug 14 11:52:54 | checker tur: message table size = 3
Aug 14 11:52:54 | loading //lib/multipath/libprioconst.so prioritizer
Aug 14 11:52:54 | foreign library "nvme" loaded successfully
Aug 14 11:52:54 | libdevmapper version 1.02.155 (2018-12-18)
Aug 14 11:52:54 | DM multipath kernel driver v1.13.0
Aug 14 11:52:54 | removing line '/2228a0001558b1855/
' from wwids file
Aug 14 11:52:54 | found '/2228a0001558b1855/
'
wwid '2228a0001558b1855' removed
Aug 14 11:52:54 | unloading const prioritizer
Aug 14 11:52:54 | unloading tur checker

# cat /etc/multipath/wwids
# Multipath wwids, Version : 1.0
# NOTE: This file is automatically maintained by multipath and multipathd.
# You should not need to edit this file in normal circumstances.
#
# Valid WWIDs:
/2221f000155c0792e/
/3600a098000b173f60000079e5da82d73/
/222e300015555469c/
#2228a0001558b1855/

# multipath -F
# multipath -l
(no output)
# multipath -r
# multpath -l |grep dm-
3600a098000b173f60000079e5da82d73 dm-10 DELL,MD38xxf

# reboot

# multipath -ll
3600a098000b173f60000079e5da82d73 dm-10 DELL,MD38xxf
size=40T features='5 queue_if_no_path pg_init_retries 50 queue_mode mq' hwhandler='1 rdac' wp=rw
|-+- policy='service-time 0' prio=14 status=active
| |- 1:0:10:0  sdaa 65:160 active ready running
| |- 1:0:12:0  sdac 65:192 active ready running
| |- 1:0:14:0  sdae 65:224 active ready running
| `- 1:0:8:0   sdy  65:128 active ready running
`-+- policy='service-time 0' prio=9 status=enabled
  |- 1:0:11:0  sdab 65:176 active ready running
  |- 1:0:13:0  sdad 65:208 active ready running
  |- 1:0:7:0   sdx  65:112 active ready running
  `- 1:0:9:0   sdz  65:144 active ready running

#  multipath -T
defaults {
        verbosity 2
        polling_interval 5
        max_polling_interval 20
        reassign_maps "no"
        multipath_dir "//lib/multipath"
        path_selector "service-time 0"
        path_grouping_policy "failover"
        uid_attribute "ID_SERIAL"
        prio "const"
        prio_args ""
        features "0"
        path_checker "tur"
        alias_prefix "mpath"
        failback "manual"
        rr_min_io 1000
        rr_min_io_rq 1
        max_fds "max"
        rr_weight "uniform"
        queue_without_daemon "no"
        flush_on_last_del "no"
        user_friendly_names "no"
        fast_io_fail_tmo 5
        bindings_file "/etc/multipath/bindings"
        wwids_file "/etc/multipath/wwids"
        prkeys_file "/etc/multipath/prkeys"
        log_checker_err always
        all_tg_pt "no"
        retain_attached_hw_handler "yes"
        detect_prio "yes"
        detect_checker "yes"
        force_sync "no"
        strict_timing "no"
        deferred_remove "no"
        config_dir "/etc/multipath/conf.d"
        delay_watch_checks "no"
        delay_wait_checks "no"
        marginal_path_err_sample_time "no"
        marginal_path_err_rate_threshold "no"
        marginal_path_err_recheck_gap_time "no"
        marginal_path_double_failed_time "no"
        find_multipaths "strict"
        uxsock_timeout 4000
        retrigger_tries 0
        retrigger_delay 10
        missing_uev_wait_timeout 30
        skip_kpartx "no"
        disable_changed_wwids "yes"
        remove_retries 0
        ghost_delay "no"
        find_multipaths_timeout -10
}
blacklist {
        devnode "^(ram|raw|loop|fd|md|dm-|sr|scd|st|dcssblk)[0-9]"
        devnode "^(td|hd|vd)[a-z]"
        devnode "^cciss!c[0-9]d[0-9]*"
        device {
                vendor "SGI"
                product "Universal Xport"
        }
        device {
                vendor "^DGC"
                product "LUNZ"
        }
        device {
                vendor "EMC"
                product "LUNZ"
        }
        device {
                vendor "DELL"
                product "Universal Xport"
        }
        device {
                vendor "IBM"
                product "Universal Xport"
        }
        device {
                vendor "IBM"
                product "S/390"
        }
        device {
                vendor "(NETAPP|LSI|ENGENIO)"
                product "Universal Xport"
        }
        device {
                vendor "STK"
                product "Universal Xport"
        }
        device {
                vendor "SUN"
                product "Universal Xport"
        }
        device {
                vendor "(Intel|INTEL)"
                product "VTrak V-LUN"
        }
        device {
                vendor "Promise"
                product "Vess V-LUN"
        }
        device {
                vendor "Promise"
                product "VTrak V-LUN"
        }
}
blacklist_exceptions {
        property "(SCSI_IDENT_|ID_WWN)"
}
devices {
        device {
                vendor "Promise"
                product "VTrak"
                product_blacklist "VTrak V-LUN"
                path_grouping_policy "multibus"
                hardware_handler ""
                prio "const"
                failback "manual"
                no_path_retry 30
                detect_prio "no"
        }
        device {
                vendor "DELL"
                product "^MD3"
                product_blacklist "Universal Xport"
                path_grouping_policy "group_by_prio"
                path_checker "rdac"
                features "2 pg_init_retries 50"
                hardware_handler "1 rdac"
                prio "rdac"
                failback "immediate"
                no_path_retry 30
        }
}
overrides {
}
multipaths {
        multipath {
                wwid "3600a098000b173f60000079e5da82d73"
        }
}


This is the device section I had before for the Promise
        device {
                vendor "Promise"
                product "VTrak"
                product_blacklist "VTrak V-LUN"
                path_grouping_policy "multibus"
                path_selector "service-time 0"
                path_checker "tur"
                prio "alua"
                failback "immediate"
                no_path_retry 30
        }
The only real differences are the prio and failback.

Vince

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

